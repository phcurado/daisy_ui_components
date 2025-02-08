defmodule Storybook.Components.Drawer do
  use PhoenixStorybook.Story, :component

  alias DaisyUIComponents.Drawer

  def function, do: &Drawer.drawer/1

  def variations do
    [
      %Variation{
        id: :drawer,
        attributes: %{
          class: "z-10",
          selector_id: "my-drawer"
        },
        slots: [
          """
          <:drawer_content>
            <!-- Page content here -->
            <label for="my-drawer" class="btn btn-primary drawer-button">Open drawer</label>
          </:drawer_content>
          """,
          """
          <:drawer_side>
            <ul class="menu bg-base-200 text-base-content min-h-full w-80 p-4">
              <!-- Sidebar content here -->
              <li><a>Sidebar Item 1</a></li>
              <li><a>Sidebar Item 2</a></li>
            </ul>
          </:drawer_side>
          """
        ]
      },
      %Variation{
        id: :responsive,
        attributes: %{
          class: "h-56 lg:drawer-open",
          selector_id: "my-drawer-2"
        },
        slots: [
          """
          <:drawer_content class="flex flex-col items-center justify-center">
            <!-- Page content here -->
            <label for="my-drawer-2" class="btn btn-primary drawer-button lg:hidden">
              Open drawer
            </label>
          </:drawer_content>
          """,
          """
          <:drawer_side class="h-full absolute">
            <ul class="menu bg-base-200 text-base-content min-h-full w-80 p-4">
              <!-- Sidebar content here -->
              <li><a>Sidebar Item 1</a></li>
              <li><a>Sidebar Item 2</a></li>
            </ul>
          </:drawer_side>
          """
        ]
      }
    ]
  end
end
