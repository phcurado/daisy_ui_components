defmodule DaisyUIComponents.FieldsetTest do
  use ExUnit.Case

  import Phoenix.Component
  import Phoenix.LiveViewTest
  import DaisyUIComponents.Fieldset

  test "fieldset" do
    assigns = %{}

    fieldset =
      rendered_to_string(~H"""
      <.fieldset class="w-xl">Fieldset Slot</.fieldset>
      """)

    assert fieldset =~ ~s(<fieldset class="fieldset w-xl">)
    assert fieldset =~ ~s(Fieldset Slot)
  end

  test "fieldset_legend" do
    assigns = %{}

    fieldset_legend =
      rendered_to_string(~H"""
      <.fieldset_legend class="w-xl">Legend Slot</.fieldset_legend>
      """)

    assert fieldset_legend =~ ~s(<legend class="fieldset-legend w-xl">)
    assert fieldset_legend =~ ~s(Legend Slot)
  end

  test "fieldset_label" do
    assigns = %{}

    fieldset_label =
      rendered_to_string(~H"""
      <.fieldset_label class="w-xl">Label Slot</.fieldset_label>
      """)

    assert fieldset_label =~ ~s(<label class="fieldset-label w-xl">)
    assert fieldset_label =~ ~s(Label Slot)
  end
end
