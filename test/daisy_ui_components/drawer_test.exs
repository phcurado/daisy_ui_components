defmodule DaisyUIComponents.DrawerTest do
  use ExUnit.Case

  import Phoenix.Component
  import Phoenix.LiveViewTest
  import DaisyUIComponents.Drawer

  test "stats" do
    assigns = %{}

    drawer =
      rendered_to_string(~H"""
      <.drawer class="lg:drawer-open" id="drawer">
        <:page_content>
          content
        </:page_content>

        <.drawer_side drawer_id="drawer">
          <aside class="min-h-full bg-base-100 py-4 shadow-xl">
            sidebar
          </aside>
        </.drawer_side>
      </.drawer>
      """)

    assert drawer =~ ~s(<div class="drawer lg:drawer-open">)
    assert drawer =~ ~s(<input id="drawer" type="checkbox" class="drawer-toggle")
    assert drawer =~ ~s(<div class="drawer-side")
    assert drawer =~ ~s(<label for="drawer" class="drawer-overlay"></label>)
    assert drawer =~ ~s(sidebar)
    assert drawer =~ ~s(content)
  end
end
