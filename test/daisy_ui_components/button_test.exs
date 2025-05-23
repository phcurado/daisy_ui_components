defmodule DaisyUIComponents.ButtonTest do
  use ExUnit.Case

  import Phoenix.Component
  import Phoenix.LiveViewTest
  import DaisyUIComponents.Button

  alias DaisyUIComponents.Utils

  test "button" do
    assigns = %{}

    button =
      rendered_to_string(~H"""
      <.button>button slot</.button>
      """)

    assert button =~ ~s(<button class="btn">)
    assert button =~ ~s(button slot)
  end

  test "button colors" do
    for color <- Utils.colors() ++ ["neutral"] do
      assigns = %{color: color}

      assert rendered_to_string(~H"""
             <.button color={@color}>My button</.button>
             """) =~ ~s(<button class="btn btn-#{color}">)
    end
  end

  test "button sizes" do
    for size <- Utils.sizes() do
      assigns = %{size: size}

      assert rendered_to_string(~H"""
             <.button size={@size}>My button</.button>
             """) =~ ~s(<button class="btn btn-#{size}">)
    end
  end

  test "button shapes" do
    for shape <- ~w(circle square) do
      assigns = %{shape: shape}

      assert rendered_to_string(~H"""
             <.button shape={@shape} {assigns}>My button</.button>
             """) =~ ~s(<button class="btn btn-#{shape}">)
    end
  end

  test "button boolean assigns" do
    for boolean_assign <- ~w(ghost link soft dash outline active disabled glass wide block)a do
      assigns = %{boolean_assign => true}

      assert rendered_to_string(~H"""
             <.button {assigns}>My button</.button>
             """) =~ ~s(<button class="btn btn-#{to_string(boolean_assign)}">)
    end

    assigns = %{loading: true}

    assert rendered_to_string(~H"""
           <.button {assigns}>My button</.button>
           """) =~ ~s(<button class="btn loading">)

    assigns = %{no_animation: true}

    assert rendered_to_string(~H"""
           <.button {assigns}>My button</.button>
           """) =~ ~s(<button class="btn no-animation">)
  end
end
