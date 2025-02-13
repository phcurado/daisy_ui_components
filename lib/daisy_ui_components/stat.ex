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
      assign(
        assigns,
        :class,
        classes([
          "stats",
          stats_direction(assigns[:direction]),
          assigns.class
        ])
      )

    ~H"""
    <div class={@class} {@rest}>
      {render_slot(@inner_block)}
    </div>
    """
  end

  attr :class, :string, default: nil
  attr :rest, :global

  slot :figure do
    attr :class, :any
  end

  slot :title do
    attr :class, :any
  end

  slot :value do
    attr :class, :any
  end

  slot :desc do
    attr :class, :any
  end

  slot :inner_block

  def stat(assigns) do
    assigns =
      assign(
        assigns,
        :class,
        classes([
          "stat",
          assigns.class
        ])
      )

    ~H"""
    <div class={@class} {@rest}>
      {render_slot(@inner_block)}

      <.stat_figure :for={figure <- @figure} class={Map.get(figure, :class)}>
        {render_slot(figure)}
      </.stat_figure>

      <.stat_title :for={title <- @title} class={Map.get(title, :class)}>
        {render_slot(title)}
      </.stat_title>

      <.stat_value :for={value <- @value} class={Map.get(value, :class)}>
        {render_slot(value)}
      </.stat_value>

      <.stat_desc :for={desc <- @desc} class={Map.get(desc, :class)}>
        {render_slot(desc)}
      </.stat_desc>
    </div>
    """
  end

  attr :class, :string, default: nil
  attr :rest, :global
  slot :inner_block

  def stat_title(assigns) do
    assigns =
      assign(
        assigns,
        :class,
        classes([
          "stat-title",
          assigns.class
        ])
      )

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
      assign(
        assigns,
        :class,
        classes([
          "stat-value",
          assigns.class
        ])
      )

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
      assign(
        assigns,
        :class,
        classes([
          "stat-desc",
          assigns.class
        ])
      )

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
      assign(
        assigns,
        :class,
        classes([
          "stat-figure",
          assigns.class
        ])
      )

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
      assign(
        assigns,
        :class,
        classes([
          "stat-actions",
          assigns.class
        ])
      )

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
end
