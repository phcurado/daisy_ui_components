defmodule DaisyUIComponents.BadgeTest do
  use ExUnit.Case

  import Phoenix.Component
  import Phoenix.LiveViewTest
  import DaisyUIComponents.Badge

  alias DaisyUIComponents.Utils

  test "badge" do
    assigns = %{}

    badge =
      rendered_to_string(~H"""
      <.badge>badge slot</.badge>
      """)

    assert badge =~ ~s(<div class="badge">)
    assert badge =~ ~s(badge slot)
  end

  test "badge colors" do
    for color <- Utils.colors() ++ ["neutral"] do
      assigns = %{color: color}

      assert rendered_to_string(~H"""
             <.badge color={@color}>My badge</.badge>
             """) =~ ~s(<div class="badge badge-#{color}">)
    end
  end

  test "badge sizes" do
    for size <- Utils.sizes() do
      assigns = %{size: size}

      assert rendered_to_string(~H"""
             <.badge size={@size}>My badge</.badge>
             """) =~ ~s(<div class="badge badge-#{size}">)
    end
  end

  test "badge boolean assigns" do
    for boolean_assign <- ~w(ghost outline)a do
      assigns = %{boolean_assign => true}

      assert rendered_to_string(~H"""
             <.badge {assigns}>My badge</.badge>
             """) =~ ~s(<div class="badge badge-#{to_string(boolean_assign)}">)
    end
  end
end
