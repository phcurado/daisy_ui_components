defmodule Storybook.Components.Sidebar do
  use PhoenixStorybook.Story, :component

  alias DaisyUIComponents.Sidebar

  def function, do: &Sidebar.sidebar/1

  def imports,
    do: [
      {Sidebar, sidebar_items: 1},
      {Sidebar, sidebar_item: 1},
      {Sidebar, sidebar_menu_title: 1},
      {Sidebar, sidebar_divider: 1}
    ]

  # def layout, do: :one_column

  def variations do
    [
      %Variation{
        id: :simple_sidebar,
        attributes: %{
          id: "my-sidebar"
        },
        slots: [
          """
          <:page_content>
            <div class="p-4">
              <h1 class="text-2xl font-bold">This is a Simple sidebar</h1>
              <p>It uses tooltip links when collapsed</p>
              <p>When extended, the sidebar is a menu item with links</p>
              <p>On mobile, click on the button below to see the sidebar</p>
              <label for="sidebar-single-simple-sidebar" class="btn btn-primary mt-4">
                Open Sidebar
              </label>

            </div>
          </:page_content>
          """,
          """
          <.sidebar_items>
            <.sidebar_menu_title>Menu</.sidebar_menu_title>
            <.sidebar_item href="#" icon="hero-home" text="Home" active={true} />
            <.sidebar_item href="#" icon="hero-information-circle" text="About" />
            <.sidebar_divider />
            <.sidebar_menu_title>Settings</.sidebar_menu_title>
            <.sidebar_item href="#" icon="hero-user" text="Profile" />
            <.sidebar_item href="#" icon="hero-logout" text="Logout" />
          </.sidebar_items>
          """
        ]
      }
    ]
  end
end
