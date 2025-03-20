defmodule DaisyUIComponents.InputTest do
  use DaisyUIComponents.ComponentCase

  import Phoenix.Component
  import DaisyUIComponents.Input

  describe "checkbox" do
    test "checkbox input" do
      assigns = %{}

      ~H"""
      <.input type="checkbox" size="xs" value="false" />
      """
      |> parse_component()
      |> assert_component("input")
      |> assert_attribute("type", "checkbox")
      |> assert_attribute("value", "false")
      |> assert_attribute("checked", nil)
      |> assert_class("checkbox checkbox-xs")
    end

    test "checkbox input without value" do
      assigns = %{}

      ~H"""
      <.input type="checkbox" size="xs" />
      """
      |> parse_component()
      |> assert_component("input")
      |> assert_attribute("type", "checkbox")
      |> assert_attribute("value", nil)
      |> assert_attribute("checked", nil)
      |> assert_class("checkbox checkbox-xs")
    end

    test "checkbox true input in form field when value is true" do
      assigns =
        %{form: Phoenix.Component.to_form(%{"checkbox_field" => true})}

      ~H"""
      <.input field={@form[:checkbox_field]} type="checkbox" />
      """
      |> parse_component()
      |> assert_component("fieldset")
      |> select_children(fn [hidden, label] ->
        hidden
        |> assert_component("input")
        |> assert_attribute("type", "hidden")
        |> assert_attribute("value", "false")
        |> assert_attribute("name", "checkbox_field")

        label
        |> assert_component("label")
        |> assert_attribute("for", "checkbox_field")
        |> assert_children("input", fn input ->
          input
          |> assert_component("input")
          |> assert_class("checkbox")
          |> assert_attribute("type", "checkbox")
          |> assert_attribute("value", "true")
          |> assert_attribute("checked", "checked")
          |> assert_attribute("name", "checkbox_field")
        end)
      end)
    end

    test "checkbox input in form field when value is false" do
      assigns =
        %{form: Phoenix.Component.to_form(%{"checkbox_field" => false})}

      ~H"""
      <.input field={@form[:checkbox_field]} type="checkbox" />
      """
      |> parse_component()
      |> assert_component("fieldset")
      |> select_children(fn [hidden, label] ->
        hidden
        |> assert_component("input")
        |> assert_attribute("type", "hidden")
        |> assert_attribute("value", "false")
        |> assert_attribute("name", "checkbox_field")

        label
        |> assert_component("label")
        |> assert_attribute("for", "checkbox_field")
        |> assert_children("input", fn input ->
          input
          |> assert_component("input")
          |> assert_class("checkbox")
          |> assert_attribute("type", "checkbox")
          |> assert_attribute("value", "true")
          |> assert_attribute("checked", nil)
          |> assert_attribute("name", "checkbox_field")
        end)
      end)
    end
  end

  describe "radio" do
    test "radio input" do
      assigns = %{}

      ~H"""
      <.input type="radio" size="xs" value="false" />
      """
      |> parse_component()
      |> assert_component("input")
      |> assert_attribute("type", "radio")
      |> assert_attribute("value", "false")
      |> assert_attribute("checked", "false")
      |> assert_class("radio radio-xs")
    end

    test "radio input without value" do
      assigns = %{}

      ~H"""
      <.input type="radio" size="xs" />
      """
      |> parse_component()
      |> assert_component("input")
      |> assert_attribute("type", "radio")
      |> assert_attribute("value", nil)
      |> assert_attribute("checked", nil)
      |> assert_class("radio radio-xs")
    end

    test "radio true input in form field when value is true" do
      assigns =
        %{form: Phoenix.Component.to_form(%{"radio_field" => true})}

      ~H"""
      <.input field={@form[:radio_field]} type="radio" />
      """
      |> parse_component()
      |> assert_component("fieldset")
      |> select_children(fn [hidden, label] ->
        hidden
        |> assert_component("input")
        |> assert_attribute("type", "hidden")
        |> assert_attribute("value", "false")
        |> assert_attribute("name", "radio_field")

        label
        |> assert_component("label")
        |> assert_attribute("for", "radio_field")
        |> assert_children("input", fn input ->
          input
          |> assert_component("input")
          |> assert_class("radio")
          |> assert_attribute("type", "radio")
          |> assert_attribute("value", "true")
          |> assert_attribute("checked", "checked")
          |> assert_attribute("name", "radio_field")
        end)
      end)
    end

    test "radio input in form field when value is false" do
      assigns =
        %{form: Phoenix.Component.to_form(%{"radio_field" => false})}

      ~H"""
      <.input field={@form[:radio_field]} type="radio" />
      """
      |> parse_component()
      |> assert_component("fieldset")
      |> select_children(fn [hidden, label] ->
        hidden
        |> assert_component("input")
        |> assert_attribute("type", "hidden")
        |> assert_attribute("value", "false")
        |> assert_attribute("name", "radio_field")

        label
        |> assert_component("label")
        |> assert_attribute("for", "radio_field")
        |> assert_children("input", fn input ->
          input
          |> assert_component("input")
          |> assert_class("radio")
          |> assert_attribute("type", "radio")
          |> assert_attribute("value", "true")
          |> assert_attribute("checked", nil)
          |> assert_attribute("name", "radio_field")
        end)
      end)
    end
  end

  describe "select input in form field" do
    test "select input" do
      assigns = %{}

      ~H"""
      <.input type="select" color="primary" size="xs" options={[admin: "admin"]} value="admin" />
      """
      |> parse_component()
      |> assert_component("select")
      |> assert_class("select select-primary select-xs")
      |> assert_children("option", fn option ->
        option
        |> assert_attribute("selected", "selected")
        |> assert_attribute("value", "admin")
        |> assert_text("admin")
      end)
    end

    test "select input in form field" do
      assigns =
        %{form: Phoenix.Component.to_form(%{"page_size" => 10}), page_options: [10, 20, 30]}

      ~H"""
      <.input label="select one" field={@form[:page_size]} type="select" options={@page_options} />
      """
      |> parse_component()
      |> assert_component("fieldset")
      |> select_children(fn [label, input] ->
        label
        |> assert_component("label")
        |> assert_class("fieldset-label")
        |> assert_attribute("for", "page_size")
        |> assert_text("select one")

        input
        |> assert_component("select")
        |> assert_class("select w-full")
        |> select_element("option", fn [first, second, third] ->
          first
          |> assert_attribute("value", "10")
          |> assert_attribute("selected", "selected")
          |> assert_text("10")

          second
          |> assert_attribute("value", "20")
          |> assert_attribute("selected", nil)
          |> assert_text("20")

          third
          |> assert_attribute("value", "30")
          |> assert_attribute("selected", nil)
          |> assert_text("30")
        end)
      end)
    end
  end

  test "textarea input" do
    assigns = %{}

    ~H"""
    <.input type="textarea" color="primary" size="xs" value="text textarea" />
    """
    |> parse_component()
    |> assert_component("textarea")
    |> assert_class("textarea textarea-primary textarea-xs")
    |> assert_text("text textarea")
  end

  test "text input" do
    assigns = %{}

    ~H"""
    <.input type="text" color="primary" size="xs" value="text input" />
    """
    |> parse_component()
    |> assert_component("input")
    |> assert_class("input input-primary input-xs")
    |> assert_attribute("type", "text")
    |> assert_attribute("value", "text input")
  end

  test "generic input" do
    assigns = %{}

    ~H"""
    <.input type="password" color="primary" size="xs" value="my password" />
    """
    |> parse_component()
    |> assert_component("input")
    |> assert_class("input input-primary input-xs")
    |> assert_attribute("type", "password")
    |> assert_attribute("value", "my password")
  end
end
