defmodule DaisyUIComponents.ModalTest do
  use DaisyUIComponents.ComponentCase

  import Phoenix.Component
  import Phoenix.LiveViewTest
  import DaisyUIComponents.Modal

  alias Phoenix.LiveView.JS

  describe "modal" do
    test "simple dialog modal" do
      assigns = %{}

      modal =
        rendered_to_string(~H"""
        <.modal id="confirm" class="w-full">
          <:modal_box class="w-11/12 max-w-5xl">
            my dialog modal
          </:modal_box>
        </.modal>
        """)

      assert modal =~ ~s(<dialog id="confirm")
      assert modal =~ ~s(class="modal w-full")
      assert modal =~ ~s(my dialog modal)
      assert modal =~ ~s(my dialog modal)
      assert modal =~ ~s(class="modal-box w-11/12 max-w-5xl")
    end

    test "modal with actions" do
      assigns = %{}

      modal =
        rendered_to_string(~H"""
        <.modal id="confirm">
          <:modal_box>
            my dialog modal
            <.modal_action class="w-10/12">
              Action from component
            </.modal_action>
            <.modal_action>
              First Action
            </.modal_action>
            <.modal_action>
              Second Action
            </.modal_action>
          </:modal_box>
        </.modal>
        """)

      assert modal =~ ~s(class="modal-action w-10/12")
      assert modal =~ ~s(Action from component)
      assert modal =~ ~s(First Action)
      assert modal =~ ~s(Second Action)
    end

    test "closed modal only ignores the open attribute" do
      assigns = %{}

      assert ~H"""
             <.modal id="confirm">
               my dialog modal
             </.modal>
             """
             |> parse_component()
             |> assert_component("dialog")
             |> attribute("phx-mounted") == Jason.encode!(JS.ignore_attributes("open"))
    end

    test "open modal ignores the open attribute before showing" do
      assigns = %{}

      assert ~H"""
             <.modal id="confirm" open>
               my dialog modal
             </.modal>
             """
             |> parse_component()
             |> assert_component("dialog")
             |> attribute("phx-mounted") ==
               Jason.encode!(show_modal(JS.ignore_attributes("open"), "confirm"))
    end

    test "shown modal ignores the open attribute before showing" do
      assigns = %{}

      assert ~H"""
             <.modal id="confirm" show>
               my dialog modal
             </.modal>
             """
             |> parse_component()
             |> assert_component("dialog")
             |> attribute("phx-mounted") ==
               Jason.encode!(show_modal(JS.ignore_attributes("open"), "confirm"))
    end
  end
end
