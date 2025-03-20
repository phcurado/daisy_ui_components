defmodule DaisyUIComponents.FormTest do
  use DaisyUIComponents.ComponentCase
  use AssertHTML

  import Phoenix.Component
  import DaisyUIComponents.Form

  test "simple_form" do
    assigns = %{}

    ~H"""
    <.simple_form for={%{}}>
      Inputs will go here
    </.simple_form>
    """
    |> parse_component()
    |> assert_component("form")
    |> assert_text("Inputs will go here")
  end

  test "form_input checkbox" do
    assigns = %{}

    ~H"""
    <.form_input
      id="1"
      name="input[name]"
      type="checkbox"
      class="text-xs"
      for="some-input"
      value="false"
      disabled
    />
    """
    |> parse_component()
    |> assert_component("fieldset")
    |> select_children(fn [hidden, label] ->
      hidden
      |> assert_component("input")
      |> assert_attribute("type", "hidden")
      |> assert_attribute("value", "false")
      |> assert_attribute("name", "input[name]")

      label
      |> assert_attribute("for", "1")
      |> assert_children("input", fn input ->
        input
        |> assert_component("input")
        |> assert_class("checkbox text-xs")
        |> assert_attribute("type", "checkbox")
        |> assert_attribute("value", "true")
        |> assert_attribute("checked", nil)
        |> assert_attribute("name", "input[name]")
      end)
    end)
  end

  test "form_input text" do
    assigns = %{}

    ~H"""
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
    """
    |> parse_component()
    |> assert_component("fieldset")
    |> select_children(fn [label, input] ->
      label
      |> assert_component("label")
      |> assert_class("fieldset-label")
      |> assert_attribute("for", "1")

      input
      |> assert_component("input")
      |> assert_class("input w-full")
      |> assert_attribute("type", "text")
      |> assert_attribute("value", "Jose")
      |> assert_attribute("name", "user[first_name]")
    end)
  end
end
