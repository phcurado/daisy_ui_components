defmodule DaisyUIComponents.ListTest do
  use DaisyUIComponents.ComponentCase

  import Phoenix.Component
  import DaisyUIComponents.List

  test "list" do
    assigns = %{}

    ~H"""
    <.list>
      <:item title="Title">Daisy</:item>
      <:item title="Description">Component library</:item>
    </.list>
    """
    |> parse_component()
    |> assert_component("ul")
    |> assert_class("list")
    |> select_element("li", fn [first, second] ->
      first_text =
        [first]
        |> assert_component("li")
        |> assert_class("list-row")
        |> text()

      assert first_text =~ "Title"
      assert first_text =~ "Daisy"

      second_text =
        [second]
        |> assert_component("li")
        |> assert_class("list-row")
        |> text()

      assert second_text =~ "Description"
      assert second_text =~ "Component library"
    end)
  end
end
