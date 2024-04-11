defmodule LiveDaisyuiComponents.ModalTest do
  use ExUnit.Case

  import Phoenix.Component
  import Phoenix.LiveViewTest
  import LiveDaisyuiComponents.Modal

  describe "modal" do
    test "simple modal" do
      assigns = %{}

      modal =
        rendered_to_string(~H"""
        <.modal id="confirm" class="w-full">
          my modal
        </.modal>
        """)

      assert modal =~ ~s(class="modal modal-bottom sm:modal-middle w-full")
      assert modal =~ ~s(my modal)
    end

    test "modal with actions" do
      assigns = %{}

      modal =
        rendered_to_string(~H"""
        <.modal id="confirm" class="w-full">
          my modal
          <:actions>
            First Action
          </:actions>
          <:actions>
            Second Action
          </:actions>
        </.modal>
        """)

      assert modal =~ ~s(First Action)
      assert modal =~ ~s(Second Action)
    end
  end

  describe "dialog_modal" do
    test "simple dialog modal" do
      assigns = %{}

      modal =
        rendered_to_string(~H"""
        <.dialog_modal id="confirm" class="w-full">
          <.modal_box modal_id="confirm" class="w-11/12 max-w-5xl">
            my dialog modal
          </.modal_box>
        </.dialog_modal>
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
        <.dialog_modal id="confirm">
          <.modal_box modal_id="confirm">
            my dialog modal
            <.modal_action class="w-10/12">
              Action from component
            </.modal_action>
            <:actions>
              First Action
            </:actions>
            <:actions>
              Second Action
            </:actions>
          </.modal_box>
        </.dialog_modal>
        """)

      assert modal =~ ~s(class="modal-action w-10/12")
      assert modal =~ ~s(Action from component)
      assert modal =~ ~s(First Action)
      assert modal =~ ~s(Second Action)
    end
  end
end
