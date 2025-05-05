defmodule <%= if not @dev do @web_namespace <> "." end %>DaisyUIComponents.Loading do
  @moduledoc """
  Loading component

  https://daisyui.com/components/loading/
  """
  use <%= if not @dev do @web_namespace <> "." end %>DaisyUIComponents, :component

  @doc """
  Renders a loading.

  ## Examples

      <.loading></.loading>
      <.loading phx-click="go" shape="infinity" color="warning" size="lg" ></.loading>
  """
  attr :class, :string, default: nil
  attr :shape, :string, required: true, values: ~w(spinner dots ring ball bars infinity)
  attr :color, :string, values: colors() ++ ["neutral"]
  attr :size, :string, values: sizes()
  attr :rest, :global, include: ~w(id)

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
    <span class={@class} {@rest}></span>
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
  defp loading_size("xl"), do: "loading-xl"
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
