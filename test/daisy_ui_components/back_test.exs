defmodule DaisyUIComponents.BackTest do
  use ExUnit.Case

  import Phoenix.Component
  import Phoenix.LiveViewTest
  import DaisyUIComponents.Back

  test "render back component" do
    assigns = %{}

    back =
      rendered_to_string(~H"""
      <.back navigate="/posts">Back to posts</.back>
      """)

    assert back =~ ~s(<a href="/posts")
    assert back =~ ~s(Back to posts)
  end
end
