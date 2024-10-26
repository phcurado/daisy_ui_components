defmodule DaisyUIComponents.ToggleTest do
  use ExUnit.Case

  import Phoenix.Component
  import Phoenix.LiveViewTest
  import DaisyUIComponents.Toggle

  alias DaisyUIComponents.Utils

  test "toggle" do
    assigns = %{}

    toggle =
      rendered_to_string(~H"""
      <.toggle checked="checked" />
      """)

    assert toggle =~ ~s(<input)
    assert toggle =~ ~s(class="toggle")
    assert toggle =~ ~s(type="checkbox")
    assert toggle =~ ~s(checked="checked")

    toggle =
      rendered_to_string(~H"""
      <.toggle />
      """)

    assert toggle =~ ~s(<input)
    assert toggle =~ ~s(class="toggle")
    assert toggle =~ ~s(type="checkbox")
  end

  test "toggle colors" do
    for color <- Utils.colors() do
      assigns = %{color: color}

      assert rendered_to_string(~H"""
             <.toggle color={@color} />
             """) =~ ~s(<input type="checkbox" class="toggle toggle-#{color}">)
    end
  end

  test "toggle sizes" do
    for size <- Utils.sizes() do
      assigns = %{size: size}

      assert rendered_to_string(~H"""
             <.toggle size={@size} />
             """) =~ ~s(<input type="checkbox" class="toggle toggle-#{size}">)
    end
  end
end
