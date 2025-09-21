defmodule DaisyUIComponents.Checkbox do
  @moduledoc """
  Checkbox component

  https://daisyui.com/components/checkbox
  """

  use DaisyUIComponents, :component

  attr :class, :any, default: nil
  attr :checked, :boolean, default: nil, doc: "the checked flag for checkbox inputs"
  attr :value, :any, default: nil
  attr :color, :string, values: colors()
  attr :size, :string, values: sizes()
  attr :rest, :global, include: ~w(form name)

  def checkbox(assigns) do
    assigns =
      assign(
        assigns,
        :class,
        classes([
          "checkbox",
          checkbox_color(assigns[:color]),
          checkbox_size(assigns[:size]),
          assigns.class
        ])
      )

    ~H"""
    <input class={@class} type="checkbox" checked={@checked} value={@value} {@rest} />
    """
  end

  # Color
  defp checkbox_color("primary"), do: "checkbox-primary"
  defp checkbox_color("secondary"), do: "checkbox-secondary"
  defp checkbox_color("accent"), do: "checkbox-accent"
  defp checkbox_color("info"), do: "checkbox-info"
  defp checkbox_color("success"), do: "checkbox-success"
  defp checkbox_color("warning"), do: "checkbox-warning"
  defp checkbox_color("error"), do: "checkbox-error"
  defp checkbox_color(_color), do: nil

  # Size
  defp checkbox_size("xs"), do: "checkbox-xs"
  defp checkbox_size("sm"), do: "checkbox-sm"
  defp checkbox_size("md"), do: "checkbox-md"
  defp checkbox_size("lg"), do: "checkbox-lg"
  defp checkbox_size("xl"), do: "checkbox-xl"
  defp checkbox_size(_size), do: nil
end
