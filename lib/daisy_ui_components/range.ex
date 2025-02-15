defmodule DaisyUIComponents.Range do
  @moduledoc """
  Select component

  https://daisyui.com/components/range
  """

  use DaisyUIComponents, :component

  attr :class, :any, default: nil
  attr :value, :any, default: nil
  attr :color, :string, values: colors()
  attr :size, :string, values: sizes()
  attr :min, :integer, default: nil
  attr :max, :integer, default: nil
  attr :step, :integer, default: nil
  attr :rest, :global, include: ~w(name)

  def range(assigns) do
    assigns =
      assigns
      |> assign_new(:color_class, fn -> range_color(assigns[:color]) end)
      |> assign_new(:size_class, fn -> range_size(assigns[:size]) end)

    ~H"""
    <input
      type="range"
      class={classes(["range", @color_class, @size_class, @class])}
      min={@min}
      max={@max}
      step={@step}
      value={@value}
      {@rest}
    />
    """
  end

  # Color
  defp range_color("primary"), do: "range-primary"
  defp range_color("secondary"), do: "range-secondary"
  defp range_color("accent"), do: "range-accent"
  defp range_color("info"), do: "range-info"
  defp range_color("success"), do: "range-success"
  defp range_color("warning"), do: "range-warning"
  defp range_color("error"), do: "range-error"
  defp range_color(_color), do: nil

  # Size
  defp range_size("xs"), do: "range-xs"
  defp range_size("sm"), do: "range-sm"
  defp range_size("md"), do: "range-md"
  defp range_size("lg"), do: "range-lg"
  defp range_size(_size), do: nil
end
