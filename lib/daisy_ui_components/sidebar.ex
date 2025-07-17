defmodule DaisyUIComponents.Sidebar do
  use DaisyUIComponents, :live_component

  import DaisyUIComponents.Icon

  @doc """
  Sidebar navigation component.

  Supports toggleable expansion, section grouping, and item icons.

  ## Slots

    * `:item` – an individual menu item with:
      - `label` (required)
      - `icon` (optional)
      - `navigate` (required)
      - `section` (optional string)

  ## Attributes

    * `expanded` - whether the sidebar is expanded
    * `toggleable` - whether to show a built-in toggle button
  """

  attr :id, :string, required: true, doc: "identifier to toggle the sidebar"
  attr :class, :any, default: nil
  attr :open, :boolean, default: nil, doc: "Forces the sidebar to be open"
  attr :expanded, :boolean, default: false, doc: "Sidebar expand width"
  attr :rest, :global

  slot :content, required: true do
    attr :class, :any
  end

  slot :item do
    attr :path, :string
    attr :method, :any
    attr :active, :boolean
    attr :icon, :string
    attr :section, :string
  end

  def sidebar(assigns) do
    ~H"""
    <.live_component
      module={__MODULE__}
      id={@id}
      class={@class}
      open={@open}
      expanded={@expanded}
      content={@content}
      item={@item}
    />
    """
  end

  def mount(socket) do
    {:ok, assign_new(socket, :expanded, fn -> true end)}
  end

  def handle_event("toggle", _params, socket) do
    {:noreply, update(socket, :expanded, &(!&1))}
  end

  def render(assigns) do
    assigns = assign(assigns, :sections, group_items(assigns.item))

    ~H"""
    <aside class={[
      "h-screen bg-base-200 border-r flex flex-col transition-all duration-300",
      if(@expanded, do: "w-64", else: "w-20")
    ]}>
      <div class="p-2 flex items-center justify-end">
        <button phx-click="toggle" phx-target={@myself} class="btn btn-sm btn-ghost">
          <.icon name={(@expanded && "hero-chevron-left") || "hero-chevron-right"} />
        </button>
      </div>

      <nav class="flex-1 overflow-y-auto">
        <%= for {section, items} <- @sections do %>
          <div class="px-2 mt-4">
            <p
              :if={@expanded}
              class="text-xs font-semibold text-gray-500 uppercase tracking-wide mb-2"
            >
              {section}
            </p>

            <%= for item <- items do %>
              <.link navigate={item.navigate} class="btn btn-ghost w-full justify-start gap-2 mb-1">
                <.icon :if={item.icon} name={item.icon} class="w-5 h-5" />
                <span :if={@expanded}>{item.label}</span>
                <div :if={!@expanded} class="tooltip tooltip-right" data-tip={item.label}></div>
              </.link>
            <% end %>
          </div>
        <% end %>
      </nav>
    </aside>
    """
  end

  defp group_items(items) do
    Enum.group_by(items, &Map.get(&1, :section, ""))
  end
end
