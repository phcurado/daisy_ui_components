defmodule DaisyUIComponents.NavbarTest do
  use ExUnit.Case

  import Phoenix.Component
  import Phoenix.LiveViewTest
  import DaisyUIComponents.Navbar

  describe "navbar" do
    test "navbar" do
      assigns = %{}

      navbar =
        rendered_to_string(~H"""
        <.navbar class="bg-base-100">
          my navbar
        </.navbar>
        """)

      assert navbar =~ ~s(<div class="navbar bg-base-100">)
      assert navbar =~ ~s(my navbar)
    end
  end

  describe "navbar_start" do
    test "navbar start" do
      assigns = %{}

      navbar_start =
        rendered_to_string(~H"""
        <.navbar_start class="w-full">
          navbar start
        </.navbar_start>
        """)

      assert navbar_start =~ ~s(<div class="navbar-start w-full">)
      assert navbar_start =~ ~s(navbar start)
    end
  end

  describe "navbar_center" do
    test "navbar center" do
      assigns = %{}

      navbar_center =
        rendered_to_string(~H"""
        <.navbar_center class="w-full">
          navbar center
        </.navbar_center>
        """)

      assert navbar_center =~ ~s(<div class="navbar-center w-full">)
      assert navbar_center =~ ~s(navbar center)
    end
  end

  describe "navbar_end" do
    test "navbar end" do
      assigns = %{}

      navbar_end =
        rendered_to_string(~H"""
        <.navbar_end class="w-full">
          navbar end
        </.navbar_end>
        """)

      assert navbar_end =~ ~s(<div class="navbar-end w-full">)
      assert navbar_end =~ ~s(navbar end)
    end
  end
end
