defmodule DaisyUIComponents.InputTest do
  use ExUnit.Case

  import Phoenix.Component
  import Phoenix.LiveViewTest
  import DaisyUIComponents.Input

  test "checkbox input" do
    assigns = %{}

    checkbox_input =
      rendered_to_string(~H"""
      <.input type="checkbox" color="primary" size="xs" value="false" />
      """)

    assert checkbox_input =~ ~s(<input)
    assert checkbox_input =~ ~s(type="checkbox")
    assert checkbox_input =~ ~s(value="false")
    assert checkbox_input =~ ~s(class="checkbox checkbox-primary checkbox-xs")
  end

  test "select input" do
    assigns = %{}

    select_input =
      rendered_to_string(~H"""
      <.input type="select" color="primary" size="xs" options={[admin: "admin"]} value="admin" />
      """)

    assert select_input =~ ~s(<select class="select select-primary select-xs">)
    assert select_input =~ ~s(<option selected value="admin">admin</option>)
  end

  test "textarea input" do
    assigns = %{}

    textarea_input =
      rendered_to_string(~H"""
      <.input type="textarea" color="primary" size="xs" value="text textarea" />
      """)

    assert textarea_input =~ ~s(<textarea class="textarea textarea-primary textarea-xs">)
    assert textarea_input =~ ~s(text textarea)
  end

  test "text input" do
    assigns = %{}

    text_input =
      rendered_to_string(~H"""
      <.input type="text" color="primary" size="xs" value="text input" />
      """)

    assert text_input =~ ~s(<input)
    assert text_input =~ ~s(type="text")
    assert text_input =~ ~s(value="text input")
    assert text_input =~ ~s(class="input input-primary input-xs")
  end

  test "generic input" do
    assigns = %{}

    text_input =
      rendered_to_string(~H"""
      <.input type="password" color="primary" size="xs" value="my password" />
      """)

    assert text_input =~ ~s(<input)
    assert text_input =~ ~s(type="password")
    assert text_input =~ ~s(value="my password")
    assert text_input =~ ~s(class="input input-primary input-xs")
  end
end
