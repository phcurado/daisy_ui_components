defmodule <%= @web_namespace %>.DaisyUIComponents.Badge do
  @moduledoc """
  Badge component

  https://daisyui.com/components/badge/
  """

  use <%= @web_namespace %>.DaisyUIComponents, :component

  @colors ~w(neutral) ++ colors()

  @doc false
  def badge_colors, do: @colors

  @doc """
  Renders a badge.

  ## Examples

      <.badge>Default</.badge>
      <.badge primary class="gap-2">Primary</.badge>
  """
  attr :class, :string, default: nil
  attr :color, :string, values: @colors
  attr :ghost, :boolean, default: false
  attr :outline, :boolean, default: false
  attr :size, :string, values: sizes()
  attr :rest, :global
  slot :inner_block

  def badge(assigns) do
    assigns =
      assign(assigns, :class, badge_classes(assigns))

    ~H"""
    <div class={@class} {@rest}>
      {render_slot(@inner_block)}
    </div>
    """
  end

  @doc """

  Returns the classes for a badge based on the provided parameters.

  ## Parameters

  - assigns - a map containing various options to customize the badge, including color, ghost, outline, size, and additional classes.
  ## Description
  Constructs a list of CSS classes for styling a badge.

  """
  def badge_classes(assigns) do
    classes([
      "badge",
      badge_color(assigns[:color]),
      maybe_add_class(assigns[:ghost], "badge-ghost"),
      maybe_add_class(assigns[:outline], "badge-outline"),
      badge_size(assigns[:size]),
      assigns.class
    ])
  end

  # Color
  defp badge_color("neutral"), do: "badge-neutral"
  defp badge_color("primary"), do: "badge-primary"
  defp badge_color("secondary"), do: "badge-secondary"
  defp badge_color("accent"), do: "badge-accent"
  defp badge_color("info"), do: "badge-info"
  defp badge_color("success"), do: "badge-success"
  defp badge_color("warning"), do: "badge-warning"
  defp badge_color("error"), do: "badge-error"
  defp badge_color(_color), do: nil

  # Size
  defp badge_size("xs"), do: "badge-xs"
  defp badge_size("sm"), do: "badge-sm"
  defp badge_size("md"), do: "badge-md"
  defp badge_size("lg"), do: "badge-lg"
  defp badge_size("xl"), do: "badge-xl"
  defp badge_size(_size), do: nil
end
