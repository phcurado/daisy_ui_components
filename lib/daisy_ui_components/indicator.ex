defmodule DaisyUIComponents.Indicator do
  @moduledoc """
  Indicator component

  https://daisyui.com/components/indicator/
  """

  use DaisyUIComponents, :component

  @aligns ~w(start end center)
  @directions ~w(top bottom middle)

  def indicator_aligns, do: @aligns
  def indicator_directions, do: @directions

  @doc ~S"""
  Renders a indicator.

  ## Examples

      <.indicator>
        <.badge color="secondary" class="indicator-item"></.badge>
        <div class="bg-base-300 grid h-32 w-32 place-items-center">content</div>
      </.indicator>
  """
  attr :class, :string, default: nil
  attr :align, :string, values: @aligns
  attr :direction, :string, values: @directions
  attr :rest, :global
  slot :inner_block

  def indicator(assigns) do
    assigns =
      assign(assigns, :class, [
        "indicator",
        indicator_direction(assigns[:direction]),
        indicator_align(assigns[:align]),
        assigns.class
      ])

    ~H"""
    <div class={@class} {@rest}>
      {render_slot(@inner_block)}
    </div>
    """
  end

  # Color
  defp indicator_direction("top"), do: "indicator-top"
  defp indicator_direction("bottom"), do: "indicator-bottom"
  defp indicator_direction("middle"), do: "indicator-middle"
  defp indicator_direction(_direction), do: nil

  # Size
  defp indicator_align("start"), do: "indicator-start"
  defp indicator_align("end"), do: "indicator-end"
  defp indicator_align("center"), do: "indicator-center"
  defp indicator_align(_align), do: nil
end
