defmodule DaisyUIComponents.CheckboxTest do
  use DaisyUIComponents.ComponentCase

  import Phoenix.Component
  import DaisyUIComponents.Checkbox

  alias DaisyUIComponents.Utils

  test "checkbox" do
    assigns = %{}

    ~H"""
    <.checkbox value="true" />
    """
    |> parse_component()
    |> assert_component("input")
    |> assert_class("checkbox")
    |> assert_attribute("type", "checkbox")
    |> assert_attribute("value", "true")
  end

  test "checkbox colors" do
    for color <- Utils.colors() do
      assigns = %{color: color}

      ~H"""
      <.checkbox color={@color} />
      """
      |> parse_component()
      |> assert_component("input")
      |> assert_class("checkbox checkbox-#{color}")
    end
  end

  test "checkbox sizes" do
    for size <- Utils.sizes() do
      assigns = %{size: size}

      ~H"""
      <.checkbox size={@size} />
      """
      |> parse_component()
      |> assert_component("input")
      |> assert_class("checkbox checkbox-#{size}")
    end
  end
end
