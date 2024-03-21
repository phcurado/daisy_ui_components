defmodule LiveDaisyuiComponents.Card do
  @moduledoc """
  Card component

  https://daisyui.com/components/card/


  """

  use LiveDaisyuiComponents.Component

  attr :bordered, :boolean, default: false
  attr :side, :boolean, default: false
  attr :padding, :string, values: ~w(normal compact)
  attr :rest, :global
  slot :inner_block

  def card(assigns) do
    assigns =
      join_classes_with_rest(assigns, [
        "card",
        add_class_from_bool(assigns[:bordered], "card-bordered"),
        add_class_from_bool(assigns[:side], "card-side"),
        add_class_from_padding(assigns[:padding])
      ])

    ~H"""
    <div {@rest}>
      <%= render_slot(@inner_block) %>
    </div>
    """
  end

  attr :rest, :global
  slot :inner_block

  def card_body(assigns) do
    assigns = join_classes_with_rest(assigns, ["card-body"])

    ~H"""
    <div {@rest}>
      <%= render_slot(@inner_block) %>
    </div>
    """
  end

  attr :label, :string, default: nil
  attr :rest, :global
  slot :inner_block

  def card_title(assigns) do
    assigns = join_classes_with_rest(assigns, ["card-title"])

    ~H"""
    <h2 {@rest}>
      <%= if render?(@label) do %>
        <%= @label %>
      <% else %>
        <%= render_slot(@inner_block) %>
      <% end %>
    </h2>
    """
  end

  attr :rest, :global
  slot :inner_block

  def card_actions(assigns) do
    assigns = join_classes_with_rest(assigns, ["card-actions"])

    ~H"""
    <div {@rest}>
      <%= render_slot(@inner_block) %>
    </div>
    """
  end

  defp add_class_from_padding("normal"), do: "card-normal"
  defp add_class_from_padding("compact"), do: "card-compact"
  defp add_class_from_padding(nil), do: nil
end
