defmodule DaisyUIComponents.DrawerTest do
  use DaisyUIComponents.ComponentCase

  import Phoenix.Component
  import DaisyUIComponents.Drawer

  test "drawer" do
    assigns = %{}

    ~H"""
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
    """
    |> parse_component()
    |> assert_component("div")
    |> assert_attribute("id", "drawer")
    |> assert_class("drawer lg:drawer-open")
    |> assert_children("div.drawer-content.w-3xl", fn child ->
      assert_text(child, "content")
    end)
    |> assert_children("input.drawer-toggle", fn child ->
      child
      |> assert_attribute("id", "my-drawer")
      |> assert_attribute("type", "checkbox")
    end)
    |> assert_children("div.drawer-side.z-1", fn child ->
      child
      |> assert_children("label.drawer-overlay", fn label ->
        label
        |> assert_attribute("for", "my-drawer")
        |> assert_attribute("aria-label", "close sidebar")
      end)
      |> assert_children("aside", fn aside ->
        aside
        |> assert_class("min-h-full bg-base-100 py-4 shadow-xl")
        |> assert_text("sidebar")
      end)
    end)
  end
end
