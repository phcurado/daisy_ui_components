defmodule DaisyUIComponents.TextareaTest do
  use DaisyUIComponents.ComponentCase

  import Phoenix.Component
  import DaisyUIComponents.Textarea

  alias DaisyUIComponents.Utils

  test "simple textarea with slot" do
    assigns = %{}

    ~H"""
    <.textarea placeholder="textarea placeholder">
      This is a textarea
    </.textarea>
    """
    |> parse_component()
    |> assert_component("textarea")
    |> assert_class("textarea")
    |> assert_attribute("placeholder", "textarea placeholder")
    |> assert_text("This is a textarea")
  end

  test "textarea colors" do
    for color <- Utils.colors() do
      assigns = %{color: color}

      ~H"""
      <.textarea color={@color} />
      """
      |> parse_component()
      |> assert_component("textarea")
      |> assert_class("textarea textarea-#{color}")
    end
  end

  test "textarea sizes" do
    for size <- Utils.sizes() do
      assigns = %{size: size}

      ~H"""
      <.textarea size={@size} />
      """
      |> parse_component()
      |> assert_component("textarea")
      |> assert_class("textarea textarea-#{size}")
    end
  end

  test "textarea boolean assigns" do
    for boolean_assign <- ~w(ghost)a do
      assigns = %{boolean_assign => true}

      ~H"""
      <.textarea {assigns} />
      """
      |> parse_component()
      |> assert_component("textarea")
      |> assert_class("textarea textarea-#{to_string(boolean_assign)}")
    end
  end

  test "textarea forwards native attributes" do
    assigns = %{}

    ~H"""
    <.textarea
      autocomplete="off"
      cols="40"
      dirname="description.dir"
      form="profile-form"
      maxlength="500"
      name="description"
      rows="8"
      wrap="hard"
      required
      disabled
      readonly
      autofocus
    />
    """
    |> parse_component()
    |> assert_component("textarea")
    |> assert_attribute("autocomplete", "off")
    |> assert_attribute("cols", "40")
    |> assert_attribute("dirname", "description.dir")
    |> assert_attribute("form", "profile-form")
    |> assert_attribute("maxlength", "500")
    |> assert_attribute("name", "description")
    |> assert_attribute("rows", "8")
    |> assert_attribute("wrap", "hard")
    |> assert_attribute("required", "required")
    |> assert_attribute("disabled", "disabled")
    |> assert_attribute("readonly", "readonly")
    |> assert_attribute("autofocus", "autofocus")
  end
end
