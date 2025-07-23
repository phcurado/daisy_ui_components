defmodule DaisyUIComponents.FormTest do
  use DaisyUIComponents.ComponentCase

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

  test "form_input toggle" do
    assigns = %{}

    ~H"""
    <.form_input
      id="1"
      name="input[name]"
      type="toggle"
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
        |> assert_class("toggle text-xs")
        |> assert_attribute("type", "checkbox")
        |> assert_attribute("value", "true")
        |> assert_attribute("checked", nil)
        |> assert_attribute("name", "input[name]")
      end)
    end)
  end

  test "form_input checkbox_group" do
    assigns = %{}

    ~H"""
    <.form_input
      id="option-selection"
      name="input[name]"
      type="checkbox_group"
      class="text-xs"
      label="Checkbox group input"
      value={["1"]}
      options={[{"Option 1", "1"}, {"Option 2", "2"}]}
    />
    """
    |> parse_component()
    |> assert_component("fieldset")
    |> select_children(fn [label, hidden_input, div_input_1, div_input_2] ->
      label
      |> assert_component("label")
      |> assert_text("Checkbox group input")

      hidden_input
      |> assert_component("input")
      |> assert_attribute("type", "hidden")
      |> assert_attribute("value", "")
      |> assert_attribute("name", "input[name][]")

      div_input_1
      |> assert_component("div")
      |> assert_children("label", fn label ->
        label
        |> assert_attribute("for", "option-selection-0")
        |> assert_children("input", fn input ->
          input
          |> assert_component("input")
          |> assert_class("checkbox text-xs")
          |> assert_attribute("type", "checkbox")
          |> assert_attribute("value", "1")
          |> assert_attribute("checked", "checked")
          |> assert_attribute("name", "input[name][]")
        end)
      end)

      div_input_2
      |> assert_component("div")
      |> assert_children("label", fn label ->
        label
        |> assert_attribute("for", "option-selection-1")
        |> assert_children("input", fn input ->
          input
          |> assert_component("input")
          |> assert_class("checkbox text-xs")
          |> assert_attribute("type", "checkbox")
          |> assert_attribute("value", "2")
          |> assert_attribute("name", "input[name][]")
          |> assert_attribute("checked", nil)
        end)
      end)
    end)
  end

  test "form_input radio" do
    assigns = %{}

    ~H"""
    <.form_input id="1" name="input[name]" type="radio" class="text-xs" for="some-input" value="true" />
    """
    |> parse_component()
    |> assert_component("fieldset")
    |> select_children(fn [hidden, label] ->
      hidden
      |> assert_component("input")
      |> assert_attribute("type", "hidden")
      |> assert_attribute("value", "false")
      |> assert_attribute("name", "input[name]")
      |> assert_attribute("disabled", nil)

      label
      |> assert_component("label")
      |> assert_attribute("for", "1")
      |> assert_children("input", fn input ->
        input
        |> assert_component("input")
        |> assert_class("radio text-xs")
        |> assert_attribute("type", "radio")
        |> assert_attribute("value", "true")
        |> assert_attribute("name", "input[name]")
        |> assert_attribute("checked", "true")
      end)
    end)
  end

  test "form_input radio_group" do
    assigns = %{}

    ~H"""
    <.form_input
      id="option-selection"
      name="input[name]"
      type="radio_group"
      class="text-xs"
      label="Radio group input"
      value={1}
      options={[{"Option 1", "1"}, {"Option 2", "2"}]}
    />
    """
    |> parse_component()
    |> assert_component("fieldset")
    |> select_children(fn [label, div_input_1, div_input_2] ->
      label
      |> assert_component("label")
      |> assert_text("Radio group input")

      div_input_1
      |> assert_component("div")
      |> assert_children("label", fn label ->
        label
        |> assert_attribute("for", "option-selection-0")
        |> assert_children("input", fn input ->
          input
          |> assert_component("input")
          |> assert_class("radio text-xs")
          |> assert_attribute("type", "radio")
          |> assert_attribute("value", "1")
          |> assert_attribute("name", "input[name]")
          |> assert_attribute("checked", "checked")
        end)
      end)

      div_input_2
      |> assert_component("div")
      |> assert_children("label", fn label ->
        label
        |> assert_attribute("for", "option-selection-1")
        |> assert_children("input", fn input ->
          input
          |> assert_component("input")
          |> assert_class("radio text-xs")
          |> assert_attribute("type", "radio")
          |> assert_attribute("value", "2")
          |> assert_attribute("name", "input[name]")
          |> assert_attribute("checked", nil)
        end)
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

  test "form_input textarea" do
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
      type="textarea"
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
      |> assert_component("textarea")
      |> assert_class("textarea w-full")
      |> assert_attribute("name", "user[first_name]")
      |> assert_text("Jose")
    end)
  end
end
