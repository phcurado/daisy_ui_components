defmodule DaisyUIComponents.ListTest do
  use ExUnit.Case

  import Phoenix.Component
  import Phoenix.LiveViewTest
  import DaisyUIComponents.List

  test "render list component" do
    assigns = %{}

    list =
      rendered_to_string(~H"""
      <.list>
        <:item title="Title">Daisy</:item>
        <:item title="Description">Component library</:item>
      </.list>
      """)

    assert list =~ ~s(<dl class="-my-4 divide-y">)
    assert list =~ ~s(<dt class="w-1/4 flex-none">)
    assert list =~ ~s(Daisy)
    assert list =~ ~s(Description)
    assert list =~ ~s(<dd>)
    assert list =~ ~s(Component library)
  end
end
