defmodule DaisyUIComponents.BadgeTest do
  use DaisyUIComponents.ComponentCase

  import Phoenix.Component
  import DaisyUIComponents.Badge

  alias DaisyUIComponents.Utils

  test "badge" do
    assigns = %{}

    ~H"""
    <.badge>badge slot</.badge>
    """
    |> parse_component()
    |> assert_component("div")
    |> assert_class("badge")
    |> assert_text("badge slot")
  end

  test "badge colors" do
    for color <- badge_colors() do
      assigns = %{color: color}

      ~H"""
      <.badge color={@color}>My Badge</.badge>
      """
      |> parse_component()
      |> assert_component("div")
      |> assert_class("badge badge-#{color}")
      |> assert_text("My Badge")
    end
  end

  test "badge sizes" do
    for size <- Utils.sizes() do
      assigns = %{size: size}

      ~H"""
      <.badge size={@size}>My Badge</.badge>
      """
      |> parse_component()
      |> assert_component("div")
      |> assert_class("badge badge-#{size}")
      |> assert_text("My Badge")
    end
  end

  test "badge boolean assigns" do
    for boolean_assign <- ~w(ghost outline)a do
      assigns = %{boolean_assign => true}

      ~H"""
      <.badge {assigns}>My Badge</.badge>
      """
      |> parse_component()
      |> assert_component("div")
      |> assert_class("badge badge-#{boolean_assign}")
      |> assert_text("My Badge")
    end
  end
end
