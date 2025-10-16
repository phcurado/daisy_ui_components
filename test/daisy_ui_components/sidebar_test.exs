defmodule DaisyUIComponents.SidebarTest do
  use DaisyUIComponents.ComponentCase

  import Phoenix.Component
  import DaisyUIComponents.Sidebar

  test "sidebar" do
    assigns = %{}

    ~H"""
    <.sidebar id="sidebar" open={true} expanded={false} class="custom-class">
      <:page_content>
        page content
      </:page_content>

      <.sidebar_items>
        <.sidebar_menu_title>Menu</.sidebar_menu_title>
        <.sidebar_divider />
        <.sidebar_item href="#item1" text="Item 1" icon="hero-arrow-up" />
        <.sidebar_item href="#item2" text="Item 2" icon="hero-arrow-down" />
      </.sidebar_items>
    </.sidebar>
    """
    |> parse_component()
    |> assert_component("div")
    |> assert_class("drawer drawer-open lg:drawer-open custom-class")
    |> assert_children("div.drawer-content", fn child ->
      assert_text(child, "page content")
    end)
    |> assert_children("input.drawer-toggle", fn child ->
      child
      |> assert_attribute("id", "sidebar_toggle")
      |> assert_attribute("type", "checkbox")
      |> assert_attribute("checked", "checked")
    end)
    |> assert_children("div.drawer-side", fn child ->
      child
      |> assert_children("label.drawer-overlay", fn label ->
        label
        |> assert_attribute("for", "sidebar_toggle")
        |> assert_attribute("aria-label", "close sidebar")
      end)
    end)
  end
end
