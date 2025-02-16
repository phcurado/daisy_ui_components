defmodule DaisyUIComponents.Indicator do
  @moduledoc """
  Indicator component

  https://daisyui.com/components/indicator/
  """

  use DaisyUIComponents, :component

  alias DaisyUIComponents.Badge

  @aligns ~w(start end center)
  @directions ~w(top bottom middle)

  def indicator_aligns, do: @aligns
  def indicator_directions, do: @directions

  @doc ~S"""
  Renders a indicator.

  ## Examples

      <.indicator>
        <:badge color="secondary" />
        <div class="bg-base-300 grid h-32 w-32 place-items-center">content</div>
      </.indicator>

  without a badge slot:

      <.indicator>
        <.badge color="secondary" class="indicator-item"></.badge>
        <div class="bg-base-300 grid h-32 w-32 place-items-center">content</div>
      </.indicator>
  """
  attr :class, :string, default: nil
  attr :rest, :global

  slot :badge do
    attr :class, :any
    attr :color, :string, values: colors()
    attr :align, :string, values: @aligns
    attr :direction, :string, values: @directions
  end

  slot :inner_block

  def indicator(assigns) do
    assigns =
      assigns
      |> assign(
        :class,
        classes([
          "indicator",
          assigns.class
        ])
      )

    ~H"""
    <div class={@class} {@rest}>
      <.badge
        :for={badge <- @badge}
        class={badge[:class]}
        color={badge[:color]}
        align={badge[:align]}
        direction={badge[:direction]}
      >
        {render_slot(badge)}
      </.badge>
      {render_slot(@inner_block)}
    </div>
    """
  end

  attr :class, :any, default: nil
  attr :color, :string
  attr :align, :string, values: @aligns
  attr :direction, :string, values: @directions
  slot :inner_block

  defp badge(assigns) do
    assigns =
      assigns
      |> assign(
        :class,
        classes([
          Badge.badge_classes(assigns),
          "indicator-item",
          indicator_align(assigns[:align]),
          indicator_direction(assigns[:direction])
        ])
      )

    ~H"""
    <span class={@class}>
      {render_slot(@inner_block)}
    </span>
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
