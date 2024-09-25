defmodule DaisyUIComponents.Loading do
  use DaisyUIComponents.Component

  attr :class, :string, default: nil
  attr :id, :string, required: true
  attr :loading, :boolean, default: false
  attr :shape, :string, required: true, values: ~w(spinner dots ring ball bars infinity)
  attr :color, :string, values: colors() ++ ["neutral"]
  attr :size, :string, values: sizes()

  def loading(assigns) do
    assigns =
      assign(assigns, :class, [
        "loading",
        loading_shape(assigns[:shape]),
        loading_color(assigns[:color]),
        loading_size(assigns[:size]),
        assigns.class
      ])

    ~H"""
    <%= if @loading == true do %>
      <span id={@id} class={@class}></span>
    <% end %>
    """
  end

  defp loading_color("neutral"), do: "text-neutral"
  defp loading_color("primary"), do: "text-primary"
  defp loading_color("secondary"), do: "text-secondary"
  defp loading_color("accent"), do: "text-accent"
  defp loading_color("info"), do: "text-info"
  defp loading_color("success"), do: "text-success"
  defp loading_color("warning"), do: "text-warning"
  defp loading_color("error"), do: "text-error"
  defp loading_color(_color), do: nil

  # Size
  defp loading_size("xs"), do: "loading-xs"
  defp loading_size("sm"), do: "loading-sm"
  defp loading_size("md"), do: "loading-md"
  defp loading_size("lg"), do: "loading-lg"
  defp loading_size(_size), do: nil

  # Shapes

  defp loading_shape("spinner"), do: "loading-spinner"
  defp loading_shape("dots"), do: "loading-dots"
  defp loading_shape("ring"), do: "loading-ring"
  defp loading_shape("ball"), do: "loading-ball"
  defp loading_shape("bars"), do: "loading-bars"
  defp loading_shape("infinity"), do: "loading-infinity"
  defp loading_shape(_shape), do: nil
end
