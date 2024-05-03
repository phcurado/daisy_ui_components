defmodule DaisyUIComponents.SelectTest do
  use ExUnit.Case

  import Phoenix.Component
  import Phoenix.LiveViewTest
  import DaisyUIComponents.Select

  alias DaisyUIComponents.Utils

  test "simple select with options" do
    assigns = %{}

    select =
      rendered_to_string(~H"""
      <.select>
        <option value="">select user</option>
        <option selected value="admin">admin</option>
        <option value="admin">admin</option>
        <option value="super_admin">Super Admin</option>
      </.select>
      """)

    assert select =~ ~s(<select class="select">)
    assert select =~ ~s(<option value="">select user</option>)
    assert select =~ ~s(<option selected value="admin">admin</option>)
    assert select =~ ~s(<option value="super_admin">Super Admin</option>)
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
