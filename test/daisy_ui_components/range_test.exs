defmodule DaisyUIComponents.RangeTest do
  use ExUnit.Case

  import Phoenix.Component
  import Phoenix.LiveViewTest
  import DaisyUIComponents.Range

  alias DaisyUIComponents.Utils

  test "range" do
    assigns = %{}

    range =
      rendered_to_string(~H"""
      <.range />
      """)

    assert range =~ ~s(<input)
    assert range =~ ~s(class="range")
    assert range =~ ~s(type="range")

    range =
      rendered_to_string(~H"""
      <.range min={0} max={100} value={10} step={25} />
      """)

    assert range =~ ~s(<input)
    assert range =~ ~s(min="0")
    assert range =~ ~s(max="100")
    assert range =~ ~s(step="25")
    assert range =~ ~s(value="10")
  end

  test "range colors" do
    for color <- Utils.colors() do
      assigns = %{color: color}

      assert rendered_to_string(~H"""
             <.range color={@color} />
             """) =~ ~s(<input type="range" class="range range-#{color}">)
    end
  end

  test "range sizes" do
    for size <- Utils.sizes() do
      assigns = %{size: size}

      assert rendered_to_string(~H"""
             <.range size={@size} />
             """) =~ ~s(<input type="range" class="range range-#{size}">)
    end
  end
end
