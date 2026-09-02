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

  test "toggle forwards native attributes" do
    assigns = %{}

    ~H"""
    <.toggle
      autocomplete="off"
      form="settings-form"
      name="notifications"
      required
      disabled
      autofocus
    />
    """
    |> parse_component()
    |> assert_component("input")
    |> assert_attribute("autocomplete", "off")
    |> assert_attribute("form", "settings-form")
    |> assert_attribute("name", "notifications")
    |> assert_attribute("required", "required")
    |> assert_attribute("disabled", "disabled")
    |> assert_attribute("autofocus", "autofocus")
  end
end
