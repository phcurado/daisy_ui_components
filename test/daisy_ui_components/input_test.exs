defmodule DaisyUIComponents.InputTest do
  use ExUnit.Case

  import Phoenix.Component
  import Phoenix.LiveViewTest
  import DaisyUIComponents.Input

  describe "checkbox" do
    test "checkbox input" do
      assigns = %{}

      checkbox_input =
        rendered_to_string(~H"""
        <.input type="checkbox" size="xs" value="false" />
        """)

      assert checkbox_input =~ ~s(<input)
      assert checkbox_input =~ ~s(type="checkbox")
      assert checkbox_input =~ ~s(value="false")
      assert checkbox_input =~ ~s(class="checkbox checkbox-xs")
    end

    test "checkbox input without value" do
      assigns = %{}

      checkbox_input =
        rendered_to_string(~H"""
        <.input type="checkbox" size="xs" />
        """)

      assert checkbox_input =~ ~s(<input)
      assert checkbox_input =~ ~s(type="checkbox")
      refute checkbox_input =~ ~s(value)
      assert checkbox_input =~ ~s(class="checkbox checkbox-xs")
    end

    test "checkbox true input in form field when value is true" do
      assigns =
        %{form: Phoenix.Component.to_form(%{"checkbox_field" => true})}

      checkbox_input =
        rendered_to_string(~H"""
        <.input field={@form[:checkbox_field]} type="checkbox" />
        """)

      assert checkbox_input =~ ~s(<input)
      assert checkbox_input =~ ~s(type="checkbox")
      assert checkbox_input =~ ~s(checked)
      assert checkbox_input =~ ~s(value="true")
      assert checkbox_input =~ ~s(class="checkbox")
    end

    test "checkbox input in form field when value is false" do
      assigns =
        %{form: Phoenix.Component.to_form(%{"checkbox_field" => false})}

      checkbox_input =
        rendered_to_string(~H"""
        <.input field={@form[:checkbox_field]} type="checkbox" />
        """)

      assert checkbox_input =~ ~s(<input)
      assert checkbox_input =~ ~s(type="checkbox")
      refute checkbox_input =~ ~s(checked)
      assert checkbox_input =~ ~s(value="true")
      assert checkbox_input =~ ~s(class="checkbox")
    end
  end

  describe "radio" do
    test "radio input" do
      assigns = %{}

      radio_input =
        rendered_to_string(~H"""
        <.input type="radio" size="xs" value="false" />
        """)

      assert radio_input =~ ~s(<input)
      assert radio_input =~ ~s(type="radio")
      assert radio_input =~ ~s(value="false")
      assert radio_input =~ ~s(class="radio radio-xs")
    end

    test "radio input without value" do
      assigns = %{}

      radio_input =
        rendered_to_string(~H"""
        <.input type="radio" size="xs" />
        """)

      assert radio_input =~ ~s(<input)
      assert radio_input =~ ~s(type="radio")
      refute radio_input =~ ~s(value)
      assert radio_input =~ ~s(class="radio radio-xs")
    end

    test "radio true input in form field when value is true" do
      assigns =
        %{form: Phoenix.Component.to_form(%{"radio_field" => true})}

      radio_input =
        rendered_to_string(~H"""
        <.input field={@form[:radio_field]} type="radio" />
        """)

      assert radio_input =~ ~s(<input)
      assert radio_input =~ ~s(type="radio")
      assert radio_input =~ ~s(checked)
      assert radio_input =~ ~s(value="true")
      assert radio_input =~ ~s(class="radio")
    end

    test "radio input in form field when value is false" do
      assigns =
        %{form: Phoenix.Component.to_form(%{"radio_field" => false})}

      radio_input =
        rendered_to_string(~H"""
        <.input field={@form[:radio_field]} type="radio" />
        """)

      assert radio_input =~ ~s(<input)
      assert radio_input =~ ~s(type="radio")
      refute radio_input =~ ~s(checked)
      assert radio_input =~ ~s(value="true")
      assert radio_input =~ ~s(class="radio")
    end
  end

  describe "select input in form field" do
    test "select input" do
      assigns = %{}

      select_input =
        rendered_to_string(~H"""
        <.input type="select" color="primary" size="xs" options={[admin: "admin"]} value="admin" />
        """)

      assert select_input =~ ~s(<select class="select select-primary select-xs">)
      assert select_input =~ ~s(<option selected value="admin">admin</option>)
    end

    test "select input in form field" do
      assigns =
        %{form: Phoenix.Component.to_form(%{"page_size" => 10}), page_options: [10, 20, 30]}

      select_input =
        rendered_to_string(~H"""
        <.input field={@form[:page_size]} type="select" options={@page_options} />
        """)

      assert select_input =~
               ~s(<select class="select select-bordered" id="page_size" name="page_size">)

      assert select_input =~ ~s(<option selected value="10">10</option>)
    end
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
