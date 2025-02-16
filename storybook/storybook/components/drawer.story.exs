defmodule Storybook.Components.Drawer do
  use PhoenixStorybook.Story, :component

  alias DaisyUIComponents.Drawer
  alias DaisyUIComponents.Menu

  def function, do: &Drawer.drawer/1

  def imports, do: [{Menu, menu: 1}]

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
            <.menu class="bg-base-200 text-base-content min-h-full w-80 p-4">
              <!-- Sidebar content here -->
              <:item><a>Sidebar Item 1</a></:item>
              <:item><a>Sidebar Item 2</a></:item>
            </.menu>
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
            <.menu class="bg-base-200 text-base-content min-h-full w-80 p-4">
              <!-- Sidebar content here -->
              <:item><a>Sidebar Item 1</a></:item>
              <:item><a>Sidebar Item 2</a></:item>
            </.menu>
          </:drawer_side>
          """
        ]
      },
      %Variation{
        id: :drawer_on_the_right_side,
        attributes: %{
          class: "z-10",
          end: true,
          selector_id: "my-drawer-4"
        },
        slots: [
          """
          <:drawer_content>
            <!-- Page content here -->
            <label for="my-drawer-4" class="drawer-button btn btn-primary">Open drawer</label>
          </:drawer_content>
          """,
          """
          <:drawer_side>
            <.menu class="bg-base-200 text-base-content min-h-full w-80 p-4">
              <!-- Sidebar content here -->
              <:item><a>Sidebar Item 1</a></:item>
              <:item><a>Sidebar Item 2</a></:item>
            </.menu>
          </:drawer_side>
          """
        ]
      }
    ]
  end
end
