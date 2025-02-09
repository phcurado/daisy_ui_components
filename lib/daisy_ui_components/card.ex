defmodule DaisyUIComponents.Card do
  @moduledoc """
  Card component

  https://daisyui.com/components/card/
  """

  use DaisyUIComponents.Component

  attr :class, :any, default: nil
  attr :bordered, :boolean, default: false
  attr :compact, :boolean, default: nil
  attr :image_full, :boolean, default: nil
  attr :side, :boolean, default: false
  attr :padding, :string, values: ~w(normal compact)
  attr :rest, :global
  slot :inner_block

  def card(assigns) do
    assigns =
      assign(
        assigns,
        :class,
        classes([
          "card",
          maybe_add_class(assigns[:bordered], "card-bordered"),
          maybe_add_class(assigns[:compact], "card-compact"),
          maybe_add_class(assigns[:side], "card-side"),
          maybe_add_class(assigns[:image_full], "image-full"),
          add_class_from_padding(assigns[:padding]),
          assigns.class
        ])
      )

    ~H"""
    <div class={@class} {@rest}>
      {render_slot(@inner_block)}
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

  defp add_class_from_padding("normal"), do: "card-normal"
  defp add_class_from_padding("compact"), do: "card-compact"
  defp add_class_from_padding(nil), do: nil
end
