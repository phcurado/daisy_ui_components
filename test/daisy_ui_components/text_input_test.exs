defmodule DaisyUIComponents.TextInputTest do
  use ExUnit.Case

  import Phoenix.Component
  import Phoenix.LiveViewTest
  import DaisyUIComponents.TextInput

  alias DaisyUIComponents.Utils

  test "text input" do
    assigns = %{}

    text_input =
      rendered_to_string(~H"""
      <.text_input placeholder="text input placeholder" />
      """)

    assert text_input =~ ~s(<input)
    assert text_input =~ ~s(class="input")
    assert text_input =~ ~s(type="text")
    assert text_input =~ ~s(placeholder="text input placeholder")

    text_input =
      rendered_to_string(~H"""
      <.text_input />
      """)

    assert text_input =~ ~s(<input)
    assert text_input =~ ~s(class="input")
    assert text_input =~ ~s(type="text")
    refute text_input =~ ~s(placeholder)
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

  test "text input bordered" do
    assigns = %{bordered: true}

    assert rendered_to_string(~H"""
           <.text_input {assigns} />
           """) =~ ~s(<input type="text" class="input">)

    assigns = %{}

    assert rendered_to_string(~H"""
           <.text_input {assigns} />
           """) =~ ~s(<input type="text" class="input">)

    assigns = %{bordered: true, ghost: false}

    assert rendered_to_string(~H"""
           <.text_input {assigns} />
           """) =~ ~s(<input type="text" class="input">)

    assigns = %{bordered: false}

    assert rendered_to_string(~H"""
           <.text_input {assigns} />
           """) =~ ~s(<input type="text" class="input input-ghost">)
  end

  test "text input ghost" do
    assigns = %{ghost: false}

    assert rendered_to_string(~H"""
           <.text_input {assigns} />
           """) =~ ~s(<input type="text" class="input">)

    assigns = %{}

    assert rendered_to_string(~H"""
           <.text_input {assigns} />
           """) =~ ~s(<input type="text" class="input">)

    assigns = %{bordered: false, ghost: true}

    assert rendered_to_string(~H"""
           <.text_input {assigns} />
           """) =~ ~s(<input type="text" class="input input-ghost">)

    assigns = %{bordered: true, ghost: false}

    assert rendered_to_string(~H"""
           <.text_input {assigns} />
           """) =~ ~s(<input type="text" class="input">)
  end

  test "text input with extra classes" do
    assigns = %{}

    assert rendered_to_string(~H"""
           <.text_input class="w-10" />
           """) =~ ~s(<input type="text" class="input w-10">)

    assert rendered_to_string(~H"""
           <.text_input class={["h-10", "w-10"]} />
           """) =~ ~s(<input type="text" class="input h-10 w-10">)
  end
end
