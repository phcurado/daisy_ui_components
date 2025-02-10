defmodule DaisyUIComponents.CardTest do
  use ExUnit.Case

  import Phoenix.Component
  import Phoenix.LiveViewTest
  import DaisyUIComponents.Card

  alias DaisyUIComponents.Card

  describe "card" do
    test "card" do
      assigns = %{}

      card =
        rendered_to_string(~H"""
        <.card class="w-full">
          my card
        </.card>
        """)

      assert card =~ ~s(<div class="card w-full">)
      assert card =~ ~s(my card)
    end

    test "card with all slots" do
      assigns = %{}

      card =
        rendered_to_string(~H"""
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
        """)

      assert card =~ ~s(<div class="card">)
      assert card =~ ~s(Card Title)
      assert card =~ ~s(<div class="card-body body">)
      assert card =~ ~s(Card Body)
      assert card =~ ~s(<div class="card-actions actions">)
      assert card =~ ~s(button>action</button>)
    end

    test "card paddings" do
      for padding <- Card.paddings() do
        assigns = %{padding: padding}

        assert rendered_to_string(~H"""
               <.card padding={@padding} />
               """) =~ ~s(<div class="card card-#{padding}">)
      end
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

        assert rendered_to_string(~H"""
               <.card modifier={@modifier} />
               """) =~ ~s(<div class="card #{modifier_class}">)
      end
    end
  end

  describe "card_body" do
    test "card body" do
      assigns = %{}

      card_body =
        rendered_to_string(~H"""
        <.card_body class="w-full">
          my card body
        </.card_body>
        """)

      assert card_body =~ ~s(<div class="card-body w-full">)
      assert card_body =~ ~s(my card body)
    end
  end

  describe "card_title" do
    test "card title" do
      assigns = %{}

      card_title =
        rendered_to_string(~H"""
        <.card_title>
          this is a card
        </.card_title>
        """)

      assert card_title =~ ~s(<h2 class="card-title">)
      assert card_title =~ ~s(this is a card)

      card_title =
        rendered_to_string(~H"""
        <.card_title class="w-full" label="title from label"></.card_title>
        """)

      assert card_title =~ ~s(<h2 class="card-title w-full">)
      assert card_title =~ ~s(title from label)
    end
  end

  describe "card_actions" do
    test "card actions" do
      assigns = %{}

      card_actions =
        rendered_to_string(~H"""
        <.card_actions class="justify-center">
          my card actions
        </.card_actions>
        """)

      assert card_actions =~ ~s(<div class="card-actions justify-center">)
      assert card_actions =~ ~s(my card actions)
    end
  end
end
