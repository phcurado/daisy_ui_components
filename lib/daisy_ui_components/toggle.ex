defmodule DaisyUIComponents.Toggle do
  @moduledoc """
  Stat component

  https://daisyui.com/components/toggle

  """

  use DaisyUIComponents.Component

  attr :class, :any, default: nil
  attr :color, :string, values: colors()
  attr :size, :string, values: sizes()
  attr :rest, :global, include: ~w(checked)

  def toggle(assigns) do
    assigns =
      assign(
        assigns,
        :class,
        classes([
          "toggle",
          toggle_color(assigns[:color]),
          toggle_size(assigns[:size]),
          assigns.class
        ])
      )

    ~H"""
    <input type="checkbox" class={@class} {@rest} />
    """
  end

  # Color
  defp toggle_color("primary"), do: "toggle-primary"
  defp toggle_color("secondary"), do: "toggle-secondary"
  defp toggle_color("accent"), do: "toggle-accent"
  defp toggle_color("info"), do: "toggle-info"
  defp toggle_color("success"), do: "toggle-success"
  defp toggle_color("warning"), do: "toggle-warning"
  defp toggle_color("error"), do: "toggle-error"
  defp toggle_color(_color), do: nil

  # Size
  defp toggle_size("xs"), do: "toggle-xs"
  defp toggle_size("sm"), do: "toggle-sm"
  defp toggle_size("md"), do: "toggle-md"
  defp toggle_size("lg"), do: "toggle-lg"
  defp toggle_size(_size), do: nil
end
