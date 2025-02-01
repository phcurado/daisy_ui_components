defmodule DaisyUIComponents.Tooltip do
  @moduledoc """
  Tooltip component

  https://daisyui.com/components/tooltip


  """

  use DaisyUIComponents.Component

  attr :class, :string, default: nil
  attr :text, :string, required: true
  attr :color, :string, values: colors()
  attr :direction, :string, values: ["left", "top", "right", "bottom"]
  attr :open, :boolean, default: false
  attr :rest, :global
  slot :inner_block

  def tooltip(assigns) do
    assigns =
      assign(
        assigns,
        :class,
        classes([
          "tooltip",
          maybe_add_class(assigns[:open], "tooltip-open"),
          tooltip_color(assigns[:color]),
          tooltip_direction(assigns[:direction]),
          assigns.class
        ])
      )

    ~H"""
    <div class={@class} data-tip={@text} {@rest}>
      {render_slot(@inner_block)}
    </div>
    """
  end

  # Color
  defp tooltip_color("primary"), do: "tooltip-primary"
  defp tooltip_color("secondary"), do: "tooltip-secondary"
  defp tooltip_color("accent"), do: "tooltip-accent"
  defp tooltip_color("info"), do: "tooltip-info"
  defp tooltip_color("success"), do: "tooltip-success"
  defp tooltip_color("warning"), do: "tooltip-warning"
  defp tooltip_color("error"), do: "tooltip-error"
  defp tooltip_color(_color), do: nil

  # Size
  defp tooltip_direction("left"), do: "tooltip-left"
  defp tooltip_direction("top"), do: "tooltip-top"
  defp tooltip_direction("right"), do: "tooltip-right"
  defp tooltip_direction("bottom"), do: "tooltip-bottom"
  defp tooltip_direction(_size), do: nil
end
