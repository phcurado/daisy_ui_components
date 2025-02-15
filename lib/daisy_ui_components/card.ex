defmodule DaisyUIComponents.Card do
  @moduledoc """
  Card component

  https://daisyui.com/components/card/
  """

  use DaisyUIComponents, :component

  @modifiers ~w(side image_full)
  @paddings ~w(normal compact)
  @placements ~w(top bottom)

  def modifiers, do: @modifiers
  def paddings, do: @paddings
  def placements, do: @placements

  attr :class, :any, default: nil
  attr :placement, :string, values: @placements
  attr :bordered, :boolean, default: false
  attr :modifier, :string, values: @modifiers
  attr :padding, :string, values: @paddings
  attr :rest, :global

  slot :card_title do
    attr :class, :any
  end

  slot :card_body do
    attr :class, :any

    slot :card_actions
  end

  slot :inner_block

  def card(assigns) do
    assigns =
      assigns
      |> assign(
        :class,
        classes([
          "card",
          maybe_add_class(assigns[:bordered], "card-bordered"),
          card_modifier(assigns[:modifier]),
          card_padding(assigns[:padding]),
          assigns.class
        ])
      )
      |> assign_new(:placement, fn -> nil end)

    ~H"""
    <div class={@class} {@rest}>
      <%= if @placement in [nil, "top"] do %>
        {render_slot(@inner_block)}
      <% end %>
      <.card_body :for={card_body <- @card_body} class={Map.get(card_body, :class)}>
        <.card_title :for={card_title <- @card_title} class={Map.get(card_title, :class)}>
          {render_slot(card_title)}
        </.card_title>
        {render_slot(card_body)}
        <.card_actions :for={card_actions <- @card_actions} class={Map.get(card_actions, :class)}>
          {render_slot(card_actions)}
        </.card_actions>
      </.card_body>

      <%= if @placement == "bottom" do %>
        {render_slot(@inner_block)}
      <% end %>
    </div>
    """
  end

  attr :class, :any, default: nil
  attr :rest, :global
  slot :inner_block

  def card_body(assigns) do
    ~H"""
    <div class={classes(["card-body", @class])} {@rest}>
      {render_slot(@inner_block)}
    </div>
    """
  end

  attr :class, :any, default: nil
  attr :label, :string, default: nil
  attr :rest, :global
  slot :inner_block

  def card_title(assigns) do
    ~H"""
    <h2 class={classes(["card-title", @class])} {@rest}>
      <%= if render?(@label) do %>
        {@label}
      <% else %>
        {render_slot(@inner_block)}
      <% end %>
    </h2>
    """
  end

  attr :class, :any, default: nil
  attr :rest, :global
  slot :inner_block

  def card_actions(assigns) do
    ~H"""
    <div class={classes(["card-actions", @class])} {@rest}>
      {render_slot(@inner_block)}
    </div>
    """
  end

  # Padding
  defp card_padding("normal"), do: "card-normal"
  defp card_padding("compact"), do: "card-compact"
  defp card_padding(nil), do: nil

  # Modifier
  defp card_modifier("side"), do: "card-side"
  defp card_modifier("image_full"), do: "image-full"
  defp card_modifier(nil), do: nil
end
