defmodule <%= if not @dev do @web_namespace <> "." end %>DaisyUIComponents.Card do
  @moduledoc """
  Card component

  https://daisyui.com/components/card/
  """

  use <%= if not @dev do @web_namespace <> "." end %>DaisyUIComponents, :component

  @modifiers ~w(side image_full)
  @placements ~w(top bottom)

  @doc """

  Returns the modifiers of the card component.

  ## Description
  Retrieves a fixed list of all possible modifiers.

  """
  def modifiers, do: @modifiers

  @doc """

  Returns the placements of the card component.

  ## Description
  Retrieves a fixed list of all possible placements.

  """
  def placements, do: @placements

  attr :class, :any, default: nil
  attr :size, :string, values: sizes()
  attr :placement, :string, values: @placements
  attr :bordered, :boolean, default: false
  attr :modifier, :string, values: @modifiers
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
          maybe_add_class(assigns[:bordered], "card-border"),
          card_size(assigns[:size]),
          card_modifier(assigns[:modifier]),
          assigns.class
        ])
      )
      |> assign_new(:placement, fn -> nil end)

    ~H"""
    <div class={@class} {@rest}>
      <%%= if @placement in [nil, "top"] do %>
        {render_slot(@inner_block)}
      <%% end %>
      <.card_body :for={card_body <- @card_body} class={Map.get(card_body, :class)}>
        <.card_title :for={card_title <- @card_title} class={Map.get(card_title, :class)}>
          {render_slot(card_title)}
        </.card_title>
        {render_slot(card_body)}
        <.card_actions :for={card_actions <- @card_actions} class={Map.get(card_actions, :class)}>
          {render_slot(card_actions)}
        </.card_actions>
      </.card_body>

      <%%= if @placement == "bottom" do %>
        {render_slot(@inner_block)}
      <%% end %>
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
      <%%= if render?(@label) do %>
        {@label}
      <%% else %>
        {render_slot(@inner_block)}
      <%% end %>
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

  # Modifier
  defp card_modifier("side"), do: "card-side"
  defp card_modifier("image_full"), do: "image-full"
  defp card_modifier(nil), do: nil

  # Size
  defp card_size("xs"), do: "card-xs"
  defp card_size("sm"), do: "card-sm"
  defp card_size("md"), do: "card-md"
  defp card_size("lg"), do: "card-lg"
  defp card_size("xl"), do: "card-xl"
  defp card_size(_size), do: nil
end
