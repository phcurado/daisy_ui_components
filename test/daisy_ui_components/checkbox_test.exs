defmodule DaisyUIComponents.CheckboxTest do
  use ExUnit.Case

  import Phoenix.Component
  import Phoenix.LiveViewTest
  import DaisyUIComponents.Checkbox

  alias DaisyUIComponents.Utils

  test "checkbox" do
    assigns = %{}

    checkbox =
      rendered_to_string(~H"""
      <.checkbox value="true" />
      """)

    assert checkbox =~ ~s(<input class="checkbox" type="checkbox" value="true">)
  end

  test "checkbox colors" do
    for color <- Utils.colors() do
      assigns = %{color: color}

      assert rendered_to_string(~H"""
             <.checkbox color={@color} />
             """) =~ ~s(<input class="checkbox checkbox-#{color}" type="checkbox">)
    end
  end

  test "checkbox sizes" do
    for size <- Utils.sizes() do
      assigns = %{size: size}

      assert rendered_to_string(~H"""
             <.checkbox size={@size} />
             """) =~ ~s(<input class="checkbox checkbox-#{size}" type="checkbox">)
    end
  end
end
