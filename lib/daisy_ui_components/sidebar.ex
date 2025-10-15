defmodule DaisyUIComponents.Sidebar do
  use DaisyUIComponents, :live_component

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

  slot :inner_block

  def sidebar(assigns) do
    ~H"""
    <.live_component
      module={__MODULE__}
      id={@id}
      open={@open}
      expanded={@expanded}
      class={@class}
      page_content={@page_content}
      inner_block={@inner_block}
    />
    """
  end
  
  slot :inner_block

  def sidebar_menu_title(assigns) do
    ~H"""
    <li class="menu-title sb-collapsed:p-0">
      <span class="sb-collapsed:text-xs sb-collapsed:text-center">{render_slot(@inner_block)}</span>
    </li>
    """
  end

  def sidebar_divider(assigns) do
    ~H"""
      <li></li>
    """
  end

  slot :inner_block

  def sidebar_items(assigns) do
    ~H"""
    <.menu class="py-0 w-full px-2 sb-expanded:gap-2 sb-collapsed:gap-1">
      {render_slot(@inner_block)}
    </.menu>
    """
  end

  attr :path, :string, required: true
  attr :method, :string, default: nil
  attr :icon, :string, default: nil
  attr :active, :boolean, default: false
  attr :text, :string, required: true

  def sidebar_item(assigns) do
    ~H"""
    <li class="sb-collapsed:items-center">
      <.tooltip
        class="flex sb-collapsed:inline-block sb-expanded:hidden p-0 rounded-full w-10 h-10"
        text={@text}
        direction="right"
      >
        <.link
          navigate={@path}
          class={[
            "sb-item p-1 w-10 h-10 rounded-full",
            @active && "menu-active active",
            "flex items-center w-full",
            "flex-col justify-center",
            "sb-collapsed:flex sb-collapsed:flex-col sb-collapsed:items-center sb-collapsed:justify-center",
            "sb-collapsed:w-full",
            "sb-expanded:flex sb-expanded:flex-row sb-expanded:items-center sb-expanded:gap-2"
          ]}
        >
          <.icon :if={@icon} name={@icon} class="h-5 w-5" />
        </.link>
      </.tooltip>

      <.link
        navigate={@path}
        class={[
          "sb-item",
          @active && "menu-active active",
          "sb-expanded:flex sb-expanded:flex-row sb-expanded:items-center sb-expanded:gap-2 sb-expanded:px-4 sb-expanded:py-2",
          "sb-collapsed:hidden"
        ]}
      >
        <.icon :if={@icon} name={@icon} class="h-5 w-5" />
        <span class="sb-label whitespace-nowrap">{@text}</span>
      </.link>
    </li>
    """
  end

  def render(assigns) do
    assigns =
      assigns
      |> assign_new(:width, fn -> if assigns.expanded, do: "w-72", else: "w-16" end)
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
          <aside
            id={@id}
            data-expanded={to_string(@expanded)}
            class={[
              "sb transition-all duration-300 ease-in-out min-h-full bg-base-100 py-4 shadow-xl",
              @width
            ]}
          >
            <header class="flex items-center gap-2 px-3 mb-3">
              <.button
                size="xs"
                class="p-2 absolute -right-4 z-10"
                phx-click="toggle_expand"
                phx-target={@myself}
              >
                <.icon
                  name={if @expanded, do: "hero-chevron-left", else: "hero-chevron-right"}
                  class="h-3 w-3"
                />
              </.button>
            </header>
            {render_slot(@inner_block)}
          </aside>
        </:drawer_side>
      </.drawer>
    </div>
    """
  end

  def handle_event("toggle_expand", _, socket) do
    {:noreply, assign(socket, :expanded, !socket.assigns.expanded)}
  end
end
