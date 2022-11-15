defmodule LiveDaisyuiComponents.CheckboxTest do
  use ExUnit.Case

  import Phoenix.Component
  import Phoenix.LiveViewTest
  import LiveDaisyuiComponents.Checkbox

  alias LiveDaisyuiComponents.Utils

  test "checkbox" do
    assigns = %{}

    checkbox =
      rendered_to_string(~H"""
      <.checkbox />
      """)

    assert checkbox =~ ~s(<input type="checkbox" class="checkbox">)
  end

  test "checkbox colors" do
    for color <- Utils.colors() do
      assigns = %{color: color}

      assert rendered_to_string(~H"""
             <.checkbox color={@color} />
             """) =~ ~s(<input type="checkbox" class="checkbox checkbox-#{color}">)
    end
  end

  test "checkbox sizes" do
    for size <- Utils.sizes() do
      assigns = %{size: size}

      assert rendered_to_string(~H"""
             <.checkbox size={@size} />
             """) =~ ~s(<input type="checkbox" class="checkbox checkbox-#{size}">)
    end
  end
end
