defmodule DaisyUIComponents.DrawerTest do
  use ExUnit.Case

  import Phoenix.Component
  import Phoenix.LiveViewTest
  import DaisyUIComponents.Drawer

  test "stats" do
    assigns = %{}

    drawer =
      rendered_to_string(~H"""
      <.drawer id="drawer" selector_id="my-drawer" class="lg:drawer-open">
        <:drawer_content class="w-3xl">
          content
        </:drawer_content>

        <:drawer_side class="z-1">
          <aside class="min-h-full bg-base-100 py-4 shadow-xl">
            sidebar
          </aside>
        </:drawer_side>
      </.drawer>
      """)

    assert drawer =~ ~s(<div class="drawer lg:drawer-open" id="drawer">)
    assert drawer =~ ~s(<div class="drawer-content w-3xl")
    assert drawer =~ ~s(<input id="my-drawer" type="checkbox" class="drawer-toggle")
    assert drawer =~ ~s(<div class="drawer-side z-1")

    assert drawer =~
             ~s(<label for="my-drawer" aria-label="close sidebar" class="drawer-overlay"></label>)

    assert drawer =~ ~s(sidebar)
    assert drawer =~ ~s(content)
  end
end
