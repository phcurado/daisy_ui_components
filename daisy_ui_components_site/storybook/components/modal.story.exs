defmodule Storybook.Components.Modal do
  use PhoenixStorybook.Story, :component

  alias DaisyUIComponents.Button
  alias DaisyUIComponents.Modal

  def function, do: &Modal.modal/1

  def imports,
    do: [
      {Button, [button: 1]},
      {Modal, [modal_action: 1, modal_box: 1, hide_modal: 1, show_modal: 1]}
    ]

  def template do
    """
    <.button phx-click={show_modal(":variation_id")} psb-code-hidden>
      Open modal
    </.button>
    <.psb-variation/>
    """
  end

  def variations do
    [
      %Variation{
        id: :default,
        slots: [
          """
          <h3 class="text-lg font-bold">Hello!</h3>
          <p class="py-4">Press ESC key or click the button below to close</p>
          <.modal_action>
            <form method="dialog">
              <!-- if there is a button in form, it will close the modal -->
              <.button>Close</.button>
            </form>
          </.modal_action>
          """
        ]
      },
      %Variation{
        id: :closes_when_click_outside,
        slots: [
          """
          <:modal_box>
            <h3 class="text-lg font-bold">Hello!</h3>
            <p class="py-4">Press ESC key or click the button below to close</p>
          </:modal_box>
          """,
          """
          <form method="dialog" class="modal-backdrop">
            <button>close</button>
          </form>
          """
        ]
      },
      %Variation{
        id: :dialog_modal_without_a_close_button_at_corner,
        attributes: %{
          closeable: false
        },
        slots: [
          """
          <h3 class="text-lg font-bold">Hello!</h3>
          <p class="py-4">Press ESC key or click outside to close</p>
          <.modal_action>
            <form method="dialog">
            <!-- if there is a button in form, it will close the modal -->
              <.button>Close</.button>
            </form>
          </.modal_action>
          """
        ]
      },
      %Variation{
        id: :dialog_modal_with_custom_width,
        slots: [
          """
          <:modal_box class="w-11/12 max-w-5xl">
            <h3 class="text-lg font-bold">Hello!</h3>
            <p class="py-4">Press ESC key or click the button below to close</p>
            <.modal_action>
              <form method="dialog">
                <!-- if there is a button, it will close the modal -->
                <.button>Close</.button>
              </form>
            </.modal_action>
          </:modal_box>
          """
        ]
      },
      %Variation{
        id: :responsive,
        attributes: %{
          class: "modal-bottom sm:modal-middle"
        },
        slots: [
          """
          <:modal_box class="w-11/12 max-w-5xl">
            <h3 class="text-lg font-bold">Hello!</h3>
            <p class="py-4">Press ESC key or click the button below to close</p>
            <.modal_action>
              <form method="dialog">
                <!-- if there is a button in form, it will close the modal -->
                <button class="btn">Close</button>
              </form>
            </.modal_action>
          </:modal_box>
          """
        ]
      }
    ]
  end
end
