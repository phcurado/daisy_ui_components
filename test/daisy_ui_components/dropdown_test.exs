defmodule DaisyUIComponents.DropdownTest do
  use ExUnit.Case

  import Phoenix.Component
  import Phoenix.LiveViewTest
  import DaisyUIComponents.Dropdown

  test "dropdown" do
    assigns = %{}

    dropdown =
      rendered_to_string(~H"""
      <.dropdown>dropdown slot</.dropdown>
      """)

    assert dropdown =~ ~s(<details class="dropdown">)
    assert dropdown =~ ~s(dropdown slot)
  end

  test "dropdown modifiers" do
    for modifier <- [:top, :bottom, :end, :left, :right] do
      assigns = %{rest: %{modifier => true}}

      assert rendered_to_string(~H"""
             <.dropdown {@rest}>My dropdown</.dropdown>
             """) =~ ~s(<details class="dropdown dropdown-#{modifier}">)
    end
  end
end
