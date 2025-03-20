defmodule DaisyUIComponents.CardTest do
  use DaisyUIComponents.ComponentCase

  import Phoenix.Component
  import DaisyUIComponents.Card

  alias DaisyUIComponents.Card

  describe "card" do
    test "card" do
      assigns = %{}

      ~H"""
      <.card class="w-full">
        my card
      </.card>
      """
      |> parse_component()
      |> assert_component("div")
      |> assert_class("card w-full")
      |> assert_text("my card")
    end

    test "card with all slots" do
      assigns = %{}

      ~H"""
      <.card>
        <:card_title class="title">
          Card Title
        </:card_title>
        <:card_body class="body">
          Card Body
        </:card_body>
        <:card_actions class="actions">
          <button>action</button>
        </:card_actions>
      </.card>
      """
      |> parse_component()
      |> assert_component("div")
      |> assert_class("card")
      |> select_element("div .card-body", fn element ->
        element
        |> assert_class("card-body body")
        |> assert_children("h2", fn element ->
          element
          |> assert_class("card-title title")
          |> assert_text("Card Title")
        end)
        |> assert_children("div", fn element ->
          element
          |> assert_class("card-actions actions")
          |> assert_children("button", fn element ->
            element
            |> assert_text("action")
          end)
        end)
      end)
    end

    test "card modifiers" do
      for modifier <- Card.modifiers() do
        assigns = %{modifier: modifier}

        modifier_class =
          if modifier == "image_full" do
            "image-full"
          else
            "card-#{modifier}"
          end

        ~H"""
        <.card modifier={@modifier} />
        """
        |> parse_component()
        |> assert_component("div")
        |> assert_class("card #{modifier_class}")
      end
    end
  end

  describe "card_body" do
    test "card body" do
      assigns = %{}

      ~H"""
      <.card_body class="w-full">
        my card body
      </.card_body>
      """
      |> parse_component()
      |> assert_component("div")
      |> assert_class("card-body w-full")
      |> assert_text("my card body")
    end
  end

  describe "card_title" do
    test "card title" do
      assigns = %{}

      ~H"""
      <.card_title>
        this is a card
      </.card_title>
      """
      |> parse_component()
      |> assert_component("h2")
      |> assert_class("card-title")
      |> assert_text("this is a card")

      ~H"""
      <.card_title class="w-full" label="title from label"></.card_title>
      """
      |> parse_component()
      |> assert_component("h2")
      |> assert_class("card-title w-full")
      |> assert_text("title from label")
    end
  end

  describe "card_actions" do
    test "card actions" do
      assigns = %{}

      ~H"""
      <.card_actions class="justify-center">
        my card actions
      </.card_actions>
      """
      |> parse_component()
      |> assert_component("div")
      |> assert_class("card-actions justify-center")
      |> assert_text("my card actions")
    end
  end
end
