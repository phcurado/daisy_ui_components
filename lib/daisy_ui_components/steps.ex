defmodule DaisyUIComponents.Steps do
  @moduledoc """
  Steps component used to display a sequence of steps in a process.

  ## Basic Example:
      <.steps>
        <.step class="step-primary">Register</.step>
        <.step class="step-primary">Choose plan</.step>
        <.step>Purchase</.step>
        <.step>Receive Product</.step>
      </.steps>

  ## Renders:
      <ul class="steps">
        <li class="step step-primary">Register</li>
        <li class="step step-primary">Choose plan</li>
        <li class="step">Purchase</li>
        <li class="step">Receive Product</li>
      </ul>
  """

  use DaisyUIComponents, :component

  attr :class, :any, default: nil
  attr :vertical, :boolean, default: false
  attr :horizontal, :boolean, default: false
  attr :rest, :global

  slot :inner_block

  def steps(assigns) do
    assigns =
      assign(assigns, :class, steps_classes(assigns))

    ~H"""
    <ul class={@class} {@rest}>
      {render_slot(@inner_block)}
    </ul>
    """
  end

  attr :class, :any, default: nil
  attr :icon, :string, default: nil
  attr :content, :string, default: nil
  attr :color, :string, values: colors() ++ ["neutral"]

  attr :rest, :global

  slot :inner_block

  def step(assigns) do
    assigns =
      assign(assigns, :class, step_classes(assigns))

    ~H"""
    <li data-content={@content} class={@class} {@rest}>
      <span :if={@icon} class="step-icon">{@icon}</span>
      {render_slot(@inner_block)}
    </li>
    """
  end

  # Wrapper Classes
  defp steps_classes(assigns) do
    classes([
      "steps",
      maybe_add_class(assigns[:vertical], "steps-vertical"),
      maybe_add_class(assigns[:horizontal], "steps-horizontal"),
      assigns.class
    ])
  end

  # Individual Step Classes
  defp step_classes(assigns) do
    classes([
      "step",
      step_color(assigns[:color]),
      assigns.class
    ])
  end

  defp step_color("neutral"), do: "step-neutral"
  defp step_color("primary"), do: "step-primary"
  defp step_color("secondary"), do: "step-secondary"
  defp step_color("accent"), do: "step-accent"
  defp step_color("info"), do: "step-info"
  defp step_color("success"), do: "step-success"
  defp step_color("warning"), do: "step-warning"
  defp step_color("error"), do: "step-error"
  defp step_color(_), do: nil
end
