defmodule DaisyUIComponents.FooterTest do
  use DaisyUIComponents.ComponentCase

  import Phoenix.Component
  import DaisyUIComponents.Footer

  test "footer" do
    assigns = %{}

    ~H"""
    <.footer class="w-xs">Footer Slot</.footer>
    """
    |> parse_component()
    |> assert_component("footer")
    |> assert_class("footer w-xs")
    |> assert_text("Footer Slot")
  end

  test "footer directions" do
    for direction <- footer_directions() do
      assigns = %{direction: direction}

      ~H"""
      <.footer direction={@direction}>Footer Slot</.footer>
      """
      |> parse_component()
      |> assert_component("footer")
      |> assert_class("footer footer-#{direction}")
      |> assert_text("Footer Slot")
    end
  end

  test "footer placements" do
    for placement <- footer_placements() do
      assigns = %{placement: placement}

      ~H"""
      <.footer placement={@placement}>Footer Slot</.footer>
      """
      |> parse_component()
      |> assert_component("footer")
      |> assert_class("footer footer-#{placement}")
      |> assert_text("Footer Slot")
    end
  end

  test "footer_title" do
    assigns = %{}

    ~H"""
    <.footer_title class="w-xs">Some Title</.footer_title>
    """
    |> parse_component()
    |> assert_component("h6")
    |> assert_class("footer-title w-xs")
    |> assert_text("Some Title")
  end
end
