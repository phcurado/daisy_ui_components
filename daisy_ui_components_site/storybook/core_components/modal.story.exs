defmodule Storybook.CoreComponents.Modal do
  use PhoenixStorybook.Story, :component
  alias DaisyUIComponents.Button
  alias DaisyUIComponents.Modal

  def function, do: &Modal.modal/1
  def imports, do: [{Button, [button: 1]}, {Modal, [hide_modal: 1, show_modal: 1]}]

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
        slots: ["Modal body"]
      }
    ]
  end
end
