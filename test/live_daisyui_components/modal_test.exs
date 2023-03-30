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
end
