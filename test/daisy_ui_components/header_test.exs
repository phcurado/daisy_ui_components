defmodule DaisyUIComponents.HeaderTest do
  use ExUnit.Case

  import Phoenix.Component
  import Phoenix.LiveViewTest
  import DaisyUIComponents.Header

  test "header without slots" do
    assigns = %{}

    header =
      rendered_to_string(~H"""
      <.header>
        Welcome
      </.header>
      """)

    assert header =~ ~s(<h1 class="text-lg font-semibold leading-8">)
    assert header =~ ~s(Welcome)
  end

  test "header with slots" do
    assigns = %{}

    header =
      rendered_to_string(~H"""
      <.header>
        Welcome
        <:subtitle>To DaisyUI Lib</:subtitle>
        <:actions>Use now</:actions>
      </.header>
      """)

    assert header =~ ~s(<h1 class="text-lg font-semibold leading-8">)
    assert header =~ ~s(Welcome)
    assert header =~ ~s(<p class="mt-2 text-sm leading-6">)
    assert header =~ ~s(To DaisyUI Lib)
    assert header =~ ~s(Use now)
  end
end
