defmodule DaisyUIComponents.Sidebar do
  @moduledoc """
  Sidebar component
  """

  use DaisyUIComponents, :live_component

  import DaisyUIComponents.Button
  import DaisyUIComponents.Drawer
  import DaisyUIComponents.Icon
  import DaisyUIComponents.Menu

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
  end

  @doc """
  Sidebar is a LiveComponent, it handles expanded and open states
  """
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
      {@rest}
    />
    """
  end

  @impl true
  def render(assigns) do
    ~H"""
    <div>
      <.button
        phx-click={JS.toggle_class("lg:drawer-open", to: "##{@id}")}
        phx-target={@myself}
        shape="circle"
        size="xs"
      >
        <.icon :if={@expanded} name="hero-chevron-double-left" class="h-5 w-5" />
        <.icon :if={!@expanded} name="hero-chevron-double-right" class="h-5 w-5" />
      </.button>
      <.drawer id={@id} class={[@class]} selector_id={"#{@id}_selector"}>
        <:drawer_content :for={content <- @content} class={Map.get(content, :class)}>
          {render_slot(@content)}
        </:drawer_content>
        <:drawer_side class={["h-full absolute border-r", !@expanded && "sticky "]}>
          <div class="absolute top-0 right-0 z-10 will-change-unset transform-none">
            <.button
              phx-click={JS.push("toggle_expand")}
              phx-target={@myself}
              shape="circle"
              size="xs"
            >
              <.icon :if={@expanded} name="hero-chevron-double-left" class="h-5 w-5" />
              <.icon :if={!@expanded} name="hero-chevron-double-right" class="h-5 w-5" />
            </.button>
          </div>
          <.drawer_items id={"#{@id}_items"} expanded={@expanded}>
            <.sidebar_item
              :for={item <- @item}
              path={item.path}
              icon={item.icon}
              expanded={@expanded}
              active={Map.get(item, :active)}
              method={Map.get(item, :method)}
            >
              {render_slot(item)}
            </.sidebar_item>
          </.drawer_items>
        </:drawer_side>
      </.drawer>
    </div>
    """
  end

  ## Events
  @impl true
  def handle_event("toggle_expand", _params, socket) do
    socket = socket |> assign(:expanded, !socket.assigns.expanded)

    {:noreply, socket}
  end

  ## Internal Components

  attr :id, :any
  attr :expanded, :boolean, default: false
  slot :inner_block, required: true

  defp drawer_items(assigns) do
    ~H"""
    <.menu
      id={@id}
      class={[
        "bg-base-100 text-base-content min-h-full",
        @expanded && "p-4 w-80",
        !@expanded && "w-20"
      ]}
    >
      {render_slot(@inner_block)}
    </.menu>
    """
  end

  attr :path, :string, default: nil
  attr :method, :any, default: nil
  attr :active, :boolean, default: false
  attr :expanded, :boolean, default: false
  attr :icon, :string
  slot :inner_block, required: true

  def sidebar_item(assigns) do
    ~H"""
    <li>
      <.link_method
        class={!@expanded && "justify-center"}
        active={@active}
        path={@path}
        method={@method}
        expanded={@expanded}
      >
        <.icon :if={@icon} name={@icon} class="w-5 h-5 text-center" />
        <span :if={@expanded}>{render_slot(@inner_block)}</span>
      </.link_method>
    </li>
    """
  end

  defp link_method(%{method: nil} = assigns) do
    ~H"""
    <.link class={[@active && "active", @class]} navigate={@path}>
      {render_slot(@inner_block)}
    </.link>
    """
  end

  defp link_method(assigns) do
    ~H"""
    <.link class={[@active && "active", @class]} href={@path} method={@method}>
      {render_slot(@inner_block)}
    </.link>
    """
  end
end
