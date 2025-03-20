defmodule DaisyUIComponents.AvatarTest do
  use DaisyUIComponents.ComponentCase

  import Phoenix.Component
  import DaisyUIComponents.Avatar

  test "avatar" do
    assigns = %{}

    ~H"""
    <.avatar class="w-full">
      <div class="w-24 rounded-full">
        <img src="/images/stock/photo-1534528741775-53994a69daeb.jpg" />
      </div>
    </.avatar>
    """
    |> parse_component()
    |> assert_component("div")
    |> assert_class("avatar w-full")
    |> assert_children("div", fn element ->
      element
      |> assert_attribute("class", "w-24 rounded-full")
      |> assert_children("img", fn element ->
        assert_attribute(element, "src", "/images/stock/photo-1534528741775-53994a69daeb.jpg")
      end)
    end)
  end

  test "avatar online/offline" do
    assigns = %{}

    ~H"""
    <.avatar online>
      avatar slot
    </.avatar>
    """
    |> parse_component()
    |> assert_component("div")
    |> assert_class("avatar avatar-online")
    |> assert_text("avatar slot")

    ~H"""
    <.avatar offline>
      avatar slot
    </.avatar>
    """
    |> parse_component()
    |> assert_component("div")
    |> assert_class("avatar avatar-offline")
    |> assert_text("avatar slot")
  end

  test "avatar placeholder" do
    assigns = %{}

    ~H"""
    <.avatar placeholder>
      avatar slot
    </.avatar>
    """
    |> parse_component()
    |> assert_component("div")
    |> assert_class("avatar avatar-placeholder")
    |> assert_text("avatar slot")
  end
end
