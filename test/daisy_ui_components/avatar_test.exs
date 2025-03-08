defmodule DaisyUIComponents.AvatarTest do
  use ExUnit.Case

  import Phoenix.Component
  import Phoenix.LiveViewTest
  import DaisyUIComponents.Avatar

  describe "avatar" do
    test "simple avatar" do
      assigns = %{}

      avatar =
        rendered_to_string(~H"""
        <.avatar class="w-full">
          <div class="w-24 rounded-full">
            <img src="/images/stock/photo-1534528741775-53994a69daeb.jpg" />
          </div>
        </.avatar>
        """)

      assert avatar =~ ~s(<div class="avatar w-full">)
      assert avatar =~ ~s(<div class="w-24 rounded-full">)
    end

    test "avatar online/offline" do
      assigns = %{}

      avatar =
        rendered_to_string(~H"""
        <.avatar online>
          avatar
        </.avatar>
        """)

      assert avatar =~ ~s(<div class="avatar avatar-online">)

      avatar =
        rendered_to_string(~H"""
        <.avatar offline>
          avatar
        </.avatar>
        """)

      assert avatar =~ ~s(<div class="avatar avatar-offline">)

      avatar =
        rendered_to_string(~H"""
        <.avatar online offline>
          avatar
        </.avatar>
        """)

      assert avatar =~ ~s(<div class="avatar avatar-online">)
    end
  end

  test "avatar placeholder" do
    assigns = %{}

    avatar =
      rendered_to_string(~H"""
      <.avatar placeholder>
        avatar
      </.avatar>
      """)

    assert avatar =~ ~s(<div class="avatar avatar-placeholder">)
  end
end
