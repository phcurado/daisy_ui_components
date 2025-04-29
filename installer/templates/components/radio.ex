defmodule <%= @web_namespace %>.DaisyUIComponents.Radio do
  @moduledoc """
  Checkbox component

  https://daisyui.com/components/radio
  """

  use <%= @web_namespace %>.DaisyUIComponents, :component

  attr :class, :any, default: nil
  attr :checked, :boolean, default: nil, doc: "the checked flag for radio inputs"
  attr :value, :any, default: nil
  attr :color, :string, values: colors()
  attr :size, :string, values: sizes()
  attr :rest, :global, include: ~w(name)

  def radio(assigns) do
    assigns =
      assign(
        assigns,
        :class,
        classes([
          "radio",
          radio_color(assigns[:color]),
          radio_size(assigns[:size]),
          assigns.class
        ])
      )

    ~H"""
    <input class={@class} type="radio" checked={@checked} value={@value} {@rest} />
    """
  end

  # Color
  defp radio_color("primary"), do: "radio-primary"
  defp radio_color("secondary"), do: "radio-secondary"
  defp radio_color("accent"), do: "radio-accent"
  defp radio_color("info"), do: "radio-info"
  defp radio_color("success"), do: "radio-success"
  defp radio_color("warning"), do: "radio-warning"
  defp radio_color("error"), do: "radio-error"
  defp radio_color(_color), do: nil

  # Size
  defp radio_size("xs"), do: "radio-xs"
  defp radio_size("sm"), do: "radio-sm"
  defp radio_size("md"), do: "radio-md"
  defp radio_size("lg"), do: "radio-lg"
  defp radio_size("xl"), do: "radio-xl"
  defp radio_size(_size), do: nil
end
