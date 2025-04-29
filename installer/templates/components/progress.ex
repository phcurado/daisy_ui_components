defmodule <%= @web_namespace %>.DaisyUIComponents.Progress do
  @moduledoc """
  Progress component

  https://daisyui.com/components/progress/
  """

  use <%= @web_namespace %>.DaisyUIComponents, :component

  @colors ~w(neutral) ++ colors()

  @doc false
  def progress_colors, do: @colors

  @doc """
  Renders a progress.

  ## Examples

      <.progress value="30" max="100" />
  """
  attr :class, :any, default: nil
  attr :color, :string, values: @colors
  attr :rest, :global
  slot :inner_block

  def progress(assigns) do
    assigns =
      assign(
        assigns,
        :class,
        classes([
          "progress",
          progress_color(assigns[:color]),
          assigns.class
        ])
      )

    ~H"""
    <progress class={@class} {@rest}>
      {render_slot(@inner_block)}
    </progress>
    """
  end

  # Color
  defp progress_color("neutral"), do: "progress-neutral"
  defp progress_color("primary"), do: "progress-primary"
  defp progress_color("secondary"), do: "progress-secondary"
  defp progress_color("accent"), do: "progress-accent"
  defp progress_color("info"), do: "progress-info"
  defp progress_color("success"), do: "progress-success"
  defp progress_color("warning"), do: "progress-warning"
  defp progress_color("error"), do: "progress-error"
  defp progress_color(_color), do: nil
end
