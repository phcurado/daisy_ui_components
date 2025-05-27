defmodule DaisyUIComponents.CollapsleTest do
  use DaisyUIComponents.ComponentCase

  import Phoenix.Component
  import DaisyUIComponents.Collapse

  test "collapse" do
    assigns = %{}

    ~H"""
    <.collapse>
      <:title>title</:title>
      content
    </.collapse>
    """
    |> parse_component()
    |> assert_component("div")
    |> assert_class("collapse")
    |> assert_children("div.collapse-title", fn child -> assert_text(child, "title") end)
    |> assert_children("div.collapse-content", fn child -> assert_text(child, "content") end)
  end

  test "collapse checkbox" do
    assigns = %{}

    ~H"""
    <.collapse checkbox>
      <:title>collapse title</:title>
      collapse
    </.collapse>
    """
    |> parse_component()
    |> assert_component("div")
    |> assert_children("input[type='checkbox']")
  end

  test "collapse boolean assigns" do
    for boolean_assign <- ~w(arrow plus open close)a do
      assigns = %{boolean_assign => true}

      ~H"""
      <.collapse {assigns}>
        <:title>collapse title</:title>
        collapse
      </.collapse>
      """
      |> parse_component()
      |> assert_component("div")
      |> assert_class("collapse collapse-#{boolean_assign}")
    end
  end
end
