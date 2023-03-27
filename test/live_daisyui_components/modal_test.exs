defmodule LiveDaisyuiComponents.ModalTest do
  use ExUnit.Case

  import Phoenix.Component
  import Phoenix.LiveViewTest
  import LiveDaisyuiComponents.Modal

  describe "modal" do
    test "modal with inner_block" do
      assigns = %{}

      modal =
        rendered_to_string(~H"""
        <.modal class="w-full">
          my modal
        </.modal>
        """)

      assert modal =~ ~s(<div class="modal w-full">)
      assert modal =~ ~s(my modal)
    end

    test "modal with body slot" do
      assigns = %{}

      modal =
        rendered_to_string(~H"""
        <.modal>
          <:body>
            Other modal
          </:body>
        </.modal>
        """)

      assert modal =~ ~s(<div class="modal">)
      assert modal =~ ~s(<div class="modal-box">)
      assert modal =~ ~s(Other modal)
    end

    test "modal with body slot and action slot" do
      assigns = %{}

      modal =
        rendered_to_string(~H"""
        <.modal>
          <:body>
            Other modal
          </:body>
          <:actions>
            Action 1
          </:actions>
          <:actions>
            Action 2
          </:actions>
        </.modal>
        """)

      assert modal =~ ~s(<div class="modal">)
      assert modal =~ ~s(<div class="modal-box">)
      assert modal =~ ~s(<div class="modal-action">)
      assert modal =~ ~s(Action 1)
      assert modal =~ ~s(Action 2)
      assert modal =~ ~s(Other modal)
    end

    test "modal with body component" do
      assigns = %{}

      modal =
        rendered_to_string(~H"""
        <.modal>
          <.modal_body>
            Other modal
            <:actions>
              Action 1
            </:actions>
            <:actions>
              Action 2
            </:actions>
          </.modal_body>
        </.modal>
        """)

      assert modal =~ ~s(<div class="modal">)
      assert modal =~ ~s(<div class="modal-box">)
      assert modal =~ ~s(<div class="modal-action">)
      assert modal =~ ~s(Action 1)
      assert modal =~ ~s(Action 2)
      assert modal =~ ~s(Other modal)
    end
  end
end
