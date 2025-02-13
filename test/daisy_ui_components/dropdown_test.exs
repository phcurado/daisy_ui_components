defmodule DaisyUIComponents.DropdownTest do
  use ExUnit.Case

  import Phoenix.Component
  import Phoenix.LiveViewTest
  import DaisyUIComponents.Dropdown

  alias DaisyUIComponents.Utils

  test "dropdown" do
    assigns = %{}

    dropdown =
      rendered_to_string(~H"""
      <.dropdown>dropdown slot</.dropdown>
      """)

    assert dropdown =~ ~s(<div class="dropdown">)
    assert dropdown =~ ~s(dropdown slot)
  end

  test "dropdown directions" do
    for direction <- Utils.directions() do
      assigns = %{direction: direction}

      assert rendered_to_string(~H"""
             <.dropdown direction={@direction}>My dropdown</.dropdown>
             """) =~ ~s(<div class="dropdown dropdown-#{direction}">)
    end
  end

  test "dropdown boolean attributes" do
    assigns = %{}

    assert rendered_to_string(~H"""
           <.dropdown open hover align="end">My dropdown</.dropdown>
           """) =~ ~s(<div class="dropdown dropdown-end dropdown-hover dropdown-open">)
  end
end
