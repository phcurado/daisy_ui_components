defmodule DaisyUIComponents.Sidebar do
  # TODO: Testing a sidebar impl
  # TODO: Try using hooks or global assigning for sidebar expanded
  use Phoenix.LiveComponent

  import DaisyUIComponents.Button
  import DaisyUIComponents.Drawer
  import DaisyUIComponents.Icon
  import DaisyUIComponents.Tooltip
  import DaisyUIComponents.Menu

  attr :id, :string, default: "sidebar"
  attr :open, :boolean, default: true
  attr :expanded, :boolean, default: true
  attr :class, :any, default: nil
  slot :page_content, required: true
  slot :item, required: true

  def sidebar(assigns) do
    ~H"""
    <.live_component
      module={__MODULE__}
      id={@id}
      open={@open}
      expanded={@expanded}
      class={@class}
      page_content={@page_content}
      item={@item}
    />
    """
  end

  attr :path, :string, required: true
  attr :icon, :string, default: nil
  attr :active, :boolean, default: false
  attr :expanded, :boolean, default: false
  attr :text, :string, required: true

  def sidebar_item(assigns) do
    ~H"""
    <li>
        <.link :if={@expanded}
          navigate={@path}
          class={[
            "flex items-center w-full transition-all duration-200",
            @expanded && "flex-row gap-2 px-4 py-2",
            @active && "menu-active active"
          ]}
        >
          <.icon :if={@icon} name={@icon} class="h-5 w-5" />
          <span class="whitespace-nowrap">
            {@text}
          </span>
        </.link>
        <.tooltip :if={!@expanded} text={@text} direction="bottom">
          <.link
            navigate={@path}
            class={[
              "flex items-center w-full transition-all duration-200",
              "flex-col justify-center p-2",
              @active && "menu-active active"
            ]}
          >
            <.icon :if={@icon} name={@icon} class="h-5 w-5" />
          </.link>
        </.tooltip>
    </li>
    """
  end

  def render(assigns) do
    assigns =
      assigns
      |> assign_new(:width, fn -> if assigns.expanded, do: "w-72", else: "w-20" end)
      |> assign(
        :class,
        classes([
          maybe_add_class(assigns.open, "lg:drawer-open"),
          assigns.class
        ])
      )

    ~H"""
    <div>
      <.drawer class={@class} selector_id={@id <> "_toggle"}>
        <:drawer_content>
          {render_slot(@page_content)}
        </:drawer_content>

        <:drawer_side>
          <aside class={[
            "transition-all duration-300 ease-in-out",
            "min-h-full bg-base-100 py-4 shadow-xl",
            @width
          ]}>
            <div class="flex justify-end px-4 mb-4">
              <.button size="sm" phx-click="toggle_expand" phx-target={@myself}>
                <.icon
                  name={if @expanded, do: "hero-chevron-left", else: "hero-chevron-right"}
                  class="h-5 w-5"
                />
              </.button>
            </div>

            <div class="mt-4 flex-1">
              <.menu class="py-0 w-full">
                <.sidebar_item
                  :for={item <- @item}
                  expanded={@expanded}
                  path={item[:path]}
                  icon={item[:icon]}
                  active={item[:active]}
                  text={item[:text]}
                >
                </.sidebar_item>

              </.menu>
            </div>
          </aside>
        </:drawer_side>
      </.drawer>
    </div>
    """
  end

  def handle_event("toggle_expand", _, socket) do
    {:noreply, assign(socket, :expanded, !socket.assigns.expanded)}
  end

  defp classes(classes) when is_list(classes) do
    classes
    |> Enum.flat_map(&List.wrap/1)
    |> Enum.reject(&is_nil/1)
    |> Enum.join(" ")
  end

  defp classes(val), do: val || ""

  defp maybe_add_class(true, class), do: class
  defp maybe_add_class(_, _), do: nil
end
