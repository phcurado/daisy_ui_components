defmodule DaisyUIComponents.ToggleTest do
  use DaisyUIComponents.ComponentCase

  import Phoenix.Component
  import DaisyUIComponents.Toggle

  alias DaisyUIComponents.Utils

  test "toggle" do
    assigns = %{}

    ~H"""
    <.toggle value="true" />
    """
    |> parse_component()
    |> assert_component("input")
    |> assert_class("toggle")
    |> assert_attribute("type", "checkbox")
    |> assert_attribute("value", "true")
  end

  test "toggle colors" do
    for color <- Utils.colors() do
      assigns = %{color: color}

      ~H"""
      <.toggle color={@color} />
      """
      |> parse_component()
      |> assert_component("input")
      |> assert_class("toggle toggle-#{color}")
    end
  end

  test "toggle sizes" do
    for size <- Utils.sizes() do
      assigns = %{size: size}

      ~H"""
      <.toggle size={@size} />
      """
      |> parse_component()
      |> assert_component("input")
      |> assert_class("toggle toggle-#{size}")
    end
  end
end
