defmodule DaisyUIComponents.Sidebar do
  @moduledoc """
  Provides a responsive sidebar component with toggle functionality.
  The sidebar can be opened or closed, and it adjusts its width accordingly.
  It includes slots for page content and sidebar items, as well as a toggle button.
  ## Examples

      <.sidebar id="my_sidebar">
        <:page_content>
          <div class="p-4">
            <h1 class="text-2xl font-bold">Main Content</h1>
            <p>This is the main content area.</p>
          </div>
        </:page_content>

        <.sidebar_items>
          <.sidebar_menu_title>Menu</.sidebar_menu_title>
          <.sidebar_item navigate="/" icon="hero-home" text="Home" active={true} />
          <.sidebar_item navigate="/about" icon="hero-information-circle" text="About" />
          <.sidebar_divider />
          <.sidebar_menu_title>Settings</.sidebar_menu_title>
          <.sidebar_item navigate="/profile" icon="hero-user" text="Profile" />
        <.sidebar_item href="/logout" method="delete" icon="hero-logout" text="Logout" />
        </.sidebar_items>
      </.sidebar>
  """

  use DaisyUIComponents, :component

  import DaisyUIComponents.Drawer
  import DaisyUIComponents.Icon
  import DaisyUIComponents.Menu

  attr :id, :string, default: "sidebar"
  attr :always_open, :boolean, default: false
  attr :class, :any, default: nil
  attr :rest, :global

  slot :page_content, required: true
  slot :inner_block

  def sidebar(assigns) do
    assigns =
      assigns
      |> assign(
        :class,
        classes([
          "lg:drawer-open",
          assigns.class
        ])
      )

    ~H"""
    <.drawer class={@class} selector_id={@id} open={@always_open} checked={false} {@rest}>
      <:drawer_content>
        {render_slot(@page_content)}
      </:drawer_content>

      <:drawer_side class="is-drawer-close:overflow-visible">
        <aside class="is-drawer-close:w-16 is-drawer-open:w-72 min-h-full flex flex-col bg-base-100 shadow-xl">
          {render_slot(@inner_block)}
          <div class="m-2 is-drawer-close:tooltip is-drawer-close:tooltip-right" data-tip="Open">
            <label
              for={@id}
              class="btn btn-ghost btn-circle drawer-button is-drawer-open:rotate-y-180"
            >
              <svg
                xmlns="http://www.w3.org/2000/svg"
                viewBox="0 0 24 24"
                stroke-linejoin="round"
                stroke-linecap="round"
                stroke-width="2"
                fill="none"
                stroke="currentColor"
                class="inline-block size-4 my-1.5"
              >
                <path d="M4 4m0 2a2 2 0 0 1 2 -2h12a2 2 0 0 1 2 2v12a2 2 0 0 1 -2 2h-12a2 2 0 0 1 -2 -2z">
                </path>
                <path d="M9 4v16"></path>
                <path d="M14 10l2 2l-2 2"></path>
              </svg>
            </label>
          </div>
        </aside>
      </:drawer_side>
    </.drawer>
    """
  end

  def sidebar_divider(assigns) do
    ~H"""
    <li></li>
    """
  end

  def sidebar_menu_title(assigns) do
    ~H"""
    <li class="menu-title is-drawer-close:p-0">
      <span class="is-drawer-close:text-xs is-drawer-close:text-center">
        {render_slot(@inner_block)}
      </span>
    </li>
    """
  end

  slot :inner_block

  def sidebar_items(assigns) do
    ~H"""
    <.menu class="w-full grow is-drawer-open:gap-2 is-drawer-close:gap-1">
      {render_slot(@inner_block)}
    </.menu>
    """
  end

  attr :href, :string, default: nil
  attr :navigate, :string, default: nil
  attr :method, :string, default: nil
  attr :patch, :string, default: nil
  attr :icon, :string, default: nil
  attr :active, :boolean, default: false
  attr :text, :string, required: true

  attr :rest, :global

  def sidebar_item(assigns) do
    ~H"""
    <li class="is-drawer-close:items-center">
      <.link
        href={@href}
        method={@method}
        patch={@patch}
        navigate={@navigate}
        data-tip={@text}
        class={[
          @active && "menu-active active",
          "is-drawer-close:tooltip is-drawer-close:tooltip-right"
        ]}
        {@rest}
      >
        <.icon :if={@icon} name={@icon} class="h-5 w-5" />
        <span class="is-drawer-close:hidden whitespace-nowrap">{@text}</span>
      </.link>
    </li>
    """
  end
end
