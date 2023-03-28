defmodule LiveDaisyuiComponents.SelectTest do
  use ExUnit.Case

  import Phoenix.Component
  import Phoenix.LiveViewTest
  import LiveDaisyuiComponents.Select

  alias LiveDaisyuiComponents.Utils

  test "simple select" do
    assigns = %{}

    select =
      rendered_to_string(~H"""
      <.select>
        <:option disabled selected>Select your option</:option>
        <:option>First option</:option>
        <:option>Second option</:option>
      </.select>
      """)

    assert select =~ ~s(<select class="select">)
    assert select =~ ~s(<option disabled selected>)
    assert select =~ ~s(Select your option)
    assert select =~ ~s(<option>)
    assert select =~ ~s(First option)
    assert select =~ ~s(Second option)
  end

  test "select colors" do
    for color <- Utils.colors() do
      assigns = %{color: color}

      assert rendered_to_string(~H"""
             <.select color={@color} />
             """) =~ ~s(<select class="select select-#{color}">)
    end
  end

  test "select sizes" do
    for size <- Utils.sizes() do
      assigns = %{size: size}

      assert rendered_to_string(~H"""
             <.select size={@size} />
             """) =~ ~s(<select class="select select-#{size}">)
    end
  end

  test "select boolean assigns" do
    for boolean_assign <- ~w(ghost bordered)a do
      assigns = %{boolean_assign => true}

      assert rendered_to_string(~H"""
             <.select {assigns} />
             """) =~ ~s(<select class="select select-#{to_string(boolean_assign)}">)
    end
  end
end
