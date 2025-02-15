defmodule DaisyUIComponents.Select do
  @moduledoc """
  Select component

  https://daisyui.com/components/select


  """

  use DaisyUIComponents, :component

  attr :class, :any, default: nil
  attr :color, :string, values: colors()
  attr :bordered, :boolean, default: false
  attr :ghost, :boolean, default: false
  attr :size, :string, values: sizes()
  attr :value, :any, default: nil
  attr :rest, :global, include: ~w(name value multiple)
  slot :inner_block

  def select(assigns) do
    assigns =
      assigns
      |> assign(
        :class,
        classes([
          "select",
          maybe_add_class(assigns[:bordered], "select-bordered"),
          maybe_add_class(assigns[:ghost], "select-ghost"),
          select_color(assigns[:color]),
          select_size(assigns[:size]),
          assigns.class
        ])
      )

    ~H"""
    <select class={@class} {@rest}>
      {render_slot(@inner_block)}
    </select>
    """
  end

  # Color
  defp select_color("primary"), do: "select-primary"
  defp select_color("secondary"), do: "select-secondary"
  defp select_color("accent"), do: "select-accent"
  defp select_color("info"), do: "select-info"
  defp select_color("success"), do: "select-success"
  defp select_color("warning"), do: "select-warning"
  defp select_color("error"), do: "select-error"
  defp select_color(_color), do: nil

  # Size
  defp select_size("xs"), do: "select-xs"
  defp select_size("sm"), do: "select-sm"
  defp select_size("md"), do: "select-md"
  defp select_size("lg"), do: "select-lg"
  defp select_size(_size), do: nil
end
