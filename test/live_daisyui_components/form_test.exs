defmodule LiveDaisyuiComponents.FormTest do
  use ExUnit.Case

  import Phoenix.Component
  import Phoenix.LiveViewTest
  import LiveDaisyuiComponents.Form

  test "label" do
    assigns = %{}

    label =
      rendered_to_string(~H"""
      <.label class="text-xs" for="some-input" disabled>
        My label
      </.label>
      """)

    assert label =~
             ~s(<label class="label text-xs" for="some-input" disabled>)

    assert label =~ ~s(My label)
  end

  test "form_input" do
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

    assert form_input =~ ~s(<div class="form-control w-full" phx-feedback-for="input[name]">)
    assert form_input =~ ~s(<label class="label" for="1">)

    assert form_input =~
             ~s(<input type="checkbox" value="false" class="checkbox text-xs" disabled for="some-input" id="1" name="input[name]">)
  end
end
