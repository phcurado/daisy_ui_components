defmodule DaisyUIComponents.TextInput do
  @moduledoc """
  TextInput component

  https://daisyui.com/components/input


  """

  use DaisyUIComponents.Component

  attr :type, :string, default: "text"
  attr :color, :string, values: colors()
  attr :bordered, :boolean, default: false
  attr :ghost, :boolean, default: false
  attr :size, :string, values: sizes()
  attr :rest, :global, include: ~w(name value)

  def text_input(assigns) do
    assigns =
      assigns
      |> join_classes_with_rest([
        "input",
        input_color(assigns[:color]),
        add_class_from_bool(assigns[:bordered], "input-bordered"),
        add_class_from_bool(assigns[:ghost], "input-ghost"),
        input_size(assigns[:size])
      ])

    ~H"""
    <input type={@type} {@rest} />
    """
  end

  # Color
  defp input_color("primary"), do: "input-primary"
  defp input_color("secondary"), do: "input-secondary"
  defp input_color("accent"), do: "input-accent"
  defp input_color("info"), do: "input-info"
  defp input_color("success"), do: "input-success"
  defp input_color("warning"), do: "input-warning"
  defp input_color("error"), do: "input-error"
  defp input_color(_color), do: nil

  # Size
  defp input_size("xs"), do: "input-xs"
  defp input_size("sm"), do: "input-sm"
  defp input_size("md"), do: "input-md"
  defp input_size("lg"), do: "input-lg"
  defp input_size(_size), do: nil
end
