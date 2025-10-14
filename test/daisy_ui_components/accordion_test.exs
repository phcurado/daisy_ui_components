defmodule DaisyUIComponents.AccordionTest do
  use DaisyUIComponents.ComponentCase

  import Phoenix.Component
  import DaisyUIComponents.Accordion

  test "accordion" do
    assigns = %{}

    ~H"""
    <.accordion name="radio_group">
      <:title>title</:title>
      <:content>content</:content>
    </.accordion>
    """
    |> parse_component()
    |> assert_component("div")
    |> assert_class("collapse")
    |> assert_children("input[type='radio']", fn child ->
      assert_attribute(child, "name", "radio_group")
    end)
    |> assert_children("div.collapse-title", fn child -> assert_text(child, "title") end)
    |> assert_children("div.collapse-content", fn child -> assert_text(child, "content") end)
  end

  test "accordion boolean assigns" do
    for boolean_assign <- ~w(arrow plus open close)a do
      assigns = %{boolean_assign => true}

      ~H"""
      <.accordion name="accordion" {assigns}>
        <:title>accordion title</:title>
      <:content>accordion</:content>
      </.accordion>
      """
      |> parse_component()
      |> assert_component("div")
      |> assert_class("collapse collapse-#{boolean_assign}")
    end
  end
end
