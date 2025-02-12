defmodule DaisyUIComponents.Stat do
  @moduledoc """
  Stat component

  https://daisyui.com/components/stat


  """

  use DaisyUIComponents.Component

  @directions ~w(horizontal vertical)

  def directions, do: @directions

  attr :class, :string, default: nil
  attr :direction, :string, values: @directions
  attr :rest, :global
  slot :inner_block

  def stats(assigns) do
    assigns =
      assign(assigns, :class, [
        "stats",
        stats_direction(assigns[:direction]),
        assigns.class
      ])

    ~H"""
    <div class={@class} {@rest}>
      {render_slot(@inner_block)}
    </div>
    """
  end

  # Direction
  defp stats_direction("vertical"), do: "stats-vertical"
  defp stats_direction("horizontal"), do: "stats-horizontal"
  defp stats_direction(_direction), do: nil

  attr :class, :string, default: nil
  attr :rest, :global
  slot :inner_block

  def stat(assigns) do
    assigns =
      assign(assigns, :class, [
        "stat",
        assigns.class
      ])

    ~H"""
    <div class={@class} {@rest}>
      {render_slot(@inner_block)}
    </div>
    """
  end

  attr :class, :string, default: nil
  attr :rest, :global
  slot :inner_block

  def stat_title(assigns) do
    assigns =
      assign(assigns, :class, [
        "stat-title",
        assigns.class
      ])

    ~H"""
    <div class={@class} {@rest}>
      {render_slot(@inner_block)}
    </div>
    """
  end

  attr :class, :string, default: nil
  attr :rest, :global
  slot :inner_block

  def stat_value(assigns) do
    assigns =
      assign(assigns, :class, [
        "stat-value",
        assigns.class
      ])

    ~H"""
    <div class={@class} {@rest}>
      {render_slot(@inner_block)}
    </div>
    """
  end

  attr :class, :string, default: nil
  attr :rest, :global
  slot :inner_block

  def stat_desc(assigns) do
    assigns =
      assign(assigns, :class, [
        "stat-desc",
        assigns.class
      ])

    ~H"""
    <div class={@class} {@rest}>
      {render_slot(@inner_block)}
    </div>
    """
  end

  attr :class, :string, default: nil
  attr :rest, :global
  slot :inner_block

  def stat_figure(assigns) do
    assigns =
      assign(assigns, :class, [
        "stat-figure",
        assigns.class
      ])

    ~H"""
    <div class={@class} {@rest}>
      {render_slot(@inner_block)}
    </div>
    """
  end

  attr :class, :string, default: nil
  attr :rest, :global
  slot :inner_block

  def stat_actions(assigns) do
    assigns =
      assign(assigns, :class, [
        "stat-actions",
        assigns.class
      ])

    ~H"""
    <div class={@class} {@rest}>
      {render_slot(@inner_block)}
    </div>
    """
  end
end
