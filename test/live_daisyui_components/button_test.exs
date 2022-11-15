defmodule LiveDaisyuiComponents.ButtonTest do
  use ExUnit.Case

  import Phoenix.Component
  import Phoenix.LiveViewTest
  import LiveDaisyuiComponents.Button

  alias LiveDaisyuiComponents.Utils

  test "button" do
    assigns = %{}

    btn =
      rendered_to_string(~H"""
      <.button label="button label" />
      """)

    assert btn =~ ~s(<button class="btn">)
    assert btn =~ ~s(button label)

    btn_slot =
      rendered_to_string(~H"""
      <.button>button slot</.button>
      """)

    assert btn_slot =~ ~s(<button class="btn">)
    assert btn_slot =~ ~s(button slot)
  end

  test "button colors" do
    for color <- Utils.colors() do
      assigns = %{color: color}

      assert rendered_to_string(~H"""
             <.button color={@color} label="button label" />
             """) =~ ~s(<button class="btn btn-#{color}">)
    end
  end

  test "button sizes" do
    for size <- Utils.sizes() do
      assigns = %{size: size}

      assert rendered_to_string(~H"""
             <.button size={@size} label="button label" />
             """) =~ ~s(<button class="btn btn-#{size}">)
    end
  end

  test "button shapes" do
    for shape <- ~w(circle square) do
      assigns = %{shape: shape}

      assert rendered_to_string(~H"""
             <.button shape={@shape} label="button label" />
             """) =~ ~s(<button class="btn btn-#{shape}">)
    end
  end

  test "button boolean assigns" do
    for boolean_assign <- ~w(ghost link outline active disabled glass)a do
      assigns = %{boolean_assign => true}

      assert rendered_to_string(~H"""
             <.button label="button label" {assigns} />
             """) =~ ~s(<button class="btn btn-#{to_string(boolean_assign)}">)
    end
  end
end
