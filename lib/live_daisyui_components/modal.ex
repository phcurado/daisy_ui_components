defmodule LiveDaisyuiComponents.Modal do
  @moduledoc """
  Modal component

  https://daisyui.com/components/modal/

  """

  use LiveDaisyuiComponents.Component

  attr :rest, :global
  slot :body
  slot :actions, doc: "the slot for showing modal actions"
  slot :inner_block

  def modal(assigns) do
    assigns = join_classes_with_rest(assigns, ["modal"])

    ~H"""
    <div {@rest}>
      <.modal_body :if={@body != []}>
        <%= render_slot(@body) %>
        <.modal_action :for={action <- @actions}>
          <%= render_slot(action) %>
        </.modal_action>
      </.modal_body>
      <%= render_slot(@inner_block) %>
    </div>
    """
  end

  attr :rest, :global
  slot :inner_block
  slot :actions, doc: "the slot for showing modal actions"

  def modal_body(assigns) do
    assigns = join_classes_with_rest(assigns, ["modal-box"])

    ~H"""
    <div {@rest}>
      <%= render_slot(@inner_block) %>
      <.modal_action :for={action <- @actions}>
        <%= render_slot(action) %>
      </.modal_action>
    </div>
    """
  end

  attr :rest, :global
  slot :inner_block

  def modal_action(assigns) do
    assigns = join_classes_with_rest(assigns, ["modal-action"])

    ~H"""
    <div {@rest}>
      <%= render_slot(@inner_block) %>
    </div>
    """
  end
end
