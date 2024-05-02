defmodule DaisyUIComponents.TextareaTest do
  use ExUnit.Case

  import Phoenix.Component
  import Phoenix.LiveViewTest
  import DaisyUIComponents.Textarea

  alias DaisyUIComponents.Utils

  test "simple textarea with slot" do
    assigns = %{}

    textarea =
      rendered_to_string(~H"""
      <.textarea placeholder="textarea placeholder">
        This is a textarea
      </.textarea>
      """)

    assert textarea =~ ~s(<textarea)
    assert textarea =~ ~s(class="textarea")
    assert textarea =~ ~s(placeholder="textarea placeholder")
    assert textarea =~ ~s(This is a textarea)

    textarea =
      rendered_to_string(~H"""
      <.textarea />
      """)

    assert textarea =~ ~s(<textarea class="textarea">)
    refute textarea =~ ~s(text input placeholder)
  end

  test "simple textarea with value" do
    assigns = %{}

    textarea =
      rendered_to_string(~H"""
      <.textarea value="This is a textarea" />
      """)

    assert textarea =~
             ~s(<textarea class="textarea">)

    assert textarea =~ ~s(This is a textarea)
  end

  test "textarea colors" do
    for color <- Utils.colors() do
      assigns = %{color: color}

      assert rendered_to_string(~H"""
             <.textarea color={@color} />
             """) =~ ~s(<textarea class="textarea textarea-#{color}">)
    end
  end

  test "textarea sizes" do
    for size <- Utils.sizes() do
      assigns = %{size: size}

      assert rendered_to_string(~H"""
             <.textarea size={@size} />
             """) =~ ~s(<textarea class="textarea textarea-#{size}">)
    end
  end

  test "textarea boolean assigns" do
    for boolean_assign <- ~w(ghost bordered)a do
      assigns = %{boolean_assign => true}

      assert rendered_to_string(~H"""
             <.textarea {assigns} />
             """) =~ ~s(<textarea class="textarea textarea-#{to_string(boolean_assign)}">)
    end
  end
end
