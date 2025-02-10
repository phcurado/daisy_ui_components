defmodule DaisyUIComponents.MenuTest do
  use ExUnit.Case

  import Phoenix.Component
  import Phoenix.LiveViewTest
  import DaisyUIComponents.Menu

  alias DaisyUIComponents.Menu
  alias DaisyUIComponents.Utils

  describe "menu" do
    test "menu" do
      assigns = %{}

      menu =
        rendered_to_string(~H"""
        <.menu class="w-full">
          <:item class="item">Item 1</:item>
        </.menu>
        """)

      assert menu =~ ~s(<ul class="menu w-full">)
      assert menu =~ ~s(<li class="item">)
      assert menu =~ ~s(Item 1)
    end

    test "menu directions" do
      for direction <- Menu.directions() do
        assigns = %{direction: direction}

        assert rendered_to_string(~H"""
               <.menu direction={@direction} />
               """) =~ ~s(<ul class="menu menu-#{direction}">)
      end
    end

    test "menu sizes" do
      for size <- Utils.sizes() do
        assigns = %{size: size}

        assert rendered_to_string(~H"""
               <.menu size={@size} />
               """) =~ ~s(<ul class="menu menu-#{size}">)
      end
    end
  end
end
