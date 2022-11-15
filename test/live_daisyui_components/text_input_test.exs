defmodule LiveDaisyuiComponents.TextInputTest do
  use ExUnit.Case

  import Phoenix.Component
  import Phoenix.LiveViewTest
  import LiveDaisyuiComponents.TextInput

  alias LiveDaisyuiComponents.Utils

  test "text input" do
    assigns = %{}

    text_input =
      rendered_to_string(~H"""
      <.text_input placeholder="text input placeholder" />
      """)

    assert text_input =~
             ~s(<input type="text" placeholder="text input placeholder" class="input">)

    text_input =
      rendered_to_string(~H"""
      <.text_input />
      """)

    assert text_input =~ ~s(<input type="text" class="input">)
    refute text_input =~ ~s(text input placeholder)
  end

  test "text input colors" do
    for color <- Utils.colors() do
      assigns = %{color: color}

      assert rendered_to_string(~H"""
             <.text_input color={@color} />
             """) =~ ~s(<input type="text" class="input input-#{color}">)
    end
  end

  test "text input sizes" do
    for size <- Utils.sizes() do
      assigns = %{size: size}

      assert rendered_to_string(~H"""
             <.text_input size={@size} />
             """) =~ ~s(<input type="text" class="input input-#{size}">)
    end
  end

  test "text input boolean assigns" do
    for boolean_assign <- ~w(ghost bordered)a do
      assigns = %{boolean_assign => true}

      assert rendered_to_string(~H"""
             <.text_input {assigns} />
             """) =~ ~s(<input type="text" class="input input-#{to_string(boolean_assign)}">)
    end
  end
end
