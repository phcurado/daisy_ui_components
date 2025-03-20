defmodule DaisyUIComponents.TextInputTest do
  use DaisyUIComponents.ComponentCase

  import Phoenix.Component
  import DaisyUIComponents.TextInput

  alias DaisyUIComponents.Utils

  test "text input" do
    assigns = %{}

    ~H"""
    <.text_input placeholder="text input placeholder" />
    """
    |> parse_component()
    |> assert_component("input")
    |> assert_class("input")
    |> assert_attribute("type", "text")
    |> assert_attribute("placeholder", "text input placeholder")
  end

  test "text input colors" do
    for color <- Utils.colors() do
      assigns = %{color: color}

      ~H"""
      <.text_input color={@color} />
      """
      |> parse_component()
      |> assert_component("input")
      |> assert_class("input input-#{color}")
    end
  end

  test "text input sizes" do
    for size <- Utils.sizes() do
      assigns = %{size: size}

      ~H"""
      <.text_input size={@size} />
      """
      |> parse_component()
      |> assert_component("input")
      |> assert_class("input input-#{size}")
    end
  end

  test "text input boolean assigns" do
    for boolean_assign <- ~w(ghost)a do
      assigns = %{boolean_assign => true}

      ~H"""
      <.text_input {assigns} />
      """
      |> parse_component()
      |> assert_component("input")
      |> assert_class("input input-#{to_string(boolean_assign)}")
    end
  end
end
