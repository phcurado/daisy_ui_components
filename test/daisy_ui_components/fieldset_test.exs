defmodule DaisyUIComponents.FieldsetTest do
  use DaisyUIComponents.ComponentCase

  import Phoenix.Component
  import DaisyUIComponents.Fieldset

  test "fieldset" do
    assigns = %{}

    ~H"""
    <.fieldset class="w-xl">Fieldset Slot</.fieldset>
    """
    |> parse_component()
    |> assert_component("fieldset")
    |> assert_class("fieldset w-xl")
    |> assert_text("Fieldset Slot")
  end

  test "fieldset_legend" do
    assigns = %{}

    ~H"""
    <.fieldset_legend class="w-xl">Legend Slot</.fieldset_legend>
    """
    |> parse_component()
    |> assert_component("legend")
    |> assert_class("fieldset-legend w-xl")
    |> assert_text("Legend Slot")
  end

  test "fieldset_label" do
    assigns = %{}

    ~H"""
    <.fieldset_label class="w-xl">Label Slot</.fieldset_label>
    """
    |> parse_component()
    |> assert_component("label")
    |> assert_class("fieldset-label w-xl")
    |> assert_text("Label Slot")
  end
end
