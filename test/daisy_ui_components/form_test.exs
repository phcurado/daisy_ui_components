defmodule DaisyUIComponents.FormTest do
  use ExUnit.Case
  use AssertHTML

  import Phoenix.Component
  import Phoenix.LiveViewTest
  import DaisyUIComponents.Form

  test "label" do
    assigns = %{}

    label =
      rendered_to_string(~H"""
      <.label class="text-xs" for="some-input" disabled label="My label" />
      """)

    assert label =~
             ~s(<label class="label text-xs" for="some-input" disabled>)

    assert label =~ ~s(My label)
  end

  test "form_input checkbox" do
    assigns = %{}

    form_input =
      rendered_to_string(~H"""
      <.form_input
        id="1"
        name="input[name]"
        type="checkbox"
        class="text-xs"
        for="some-input"
        value="false"
        disabled
      />
      """)

    assert_html form_input, "div", class: "form-control" do
      assert_html "label", class: "label cursor-pointer", for: "1"

      assert_html "input[type='checkbox']",
        type: "checkbox",
        value: "true",
        class: "checkbox text-xs",
        for: "some-input",
        id: "1",
        name: "input[name]",
        disabled: true
    end
  end

  test "form_input text" do
    assigns = %{}

    form_input =
      rendered_to_string(~H"""
      <.form_input
        id="1"
        field={
          %Phoenix.HTML.FormField{
            id: "id",
            field: "name",
            name: "user[first_name]",
            value: "Jose",
            errors: [],
            form: Phoenix.Component.to_form(%{})
          }
        }
        type="text"
      />
      """)

    assert_html form_input, "div", class: "form-control" do
      assert_html "input[type='text']",
        type: "text",
        value: "Jose",
        class: "input",
        id: "1",
        name: "user[first_name]"
    end
  end
end
