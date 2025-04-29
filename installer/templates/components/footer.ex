defmodule <%= @web_namespace %>.DaisyUIComponents.Footer do
  @moduledoc """
  Footer component

  https://daisyui.com/components/footer/
  """

  use <%= @web_namespace %>.DaisyUIComponents, :component

  @directions ~w(horizontal vertical)
  @placements ~w(center)

  @doc false
  def footer_directions, do: @directions
  @doc false
  def footer_placements, do: @placements

  @doc """
  Renders a Footer

  ## Examples

      <.footer class="sm:footer-horizontal bg-neutral text-neutral-content p-10">
        <nav>
          <.footer_title>Services</.footer_title>
        </nav>
      </.footer>
  """

  attr :class, :string, default: nil
  attr :direction, :string, values: @directions
  attr :placement, :string, values: @placements
  attr :rest, :global
  slot :inner_block, required: true

  def footer(assigns) do
    assigns =
      assign(
        assigns,
        :class,
        classes([
          "footer",
          footer_direction(assigns[:direction]),
          footer_placement(assigns[:placement]),
          assigns.class
        ])
      )

    ~H"""
    <footer class={@class} {@rest}>
      {render_slot(@inner_block)}
    </footer>
    """
  end

  attr :class, :any, default: nil
  attr :rest, :global
  slot :inner_block, required: true

  def footer_title(assigns) do
    assigns =
      assign(
        assigns,
        :class,
        classes([
          "footer-title",
          assigns.class
        ])
      )

    ~H"""
    <h6 class={@class} {@rest}>{render_slot(@inner_block)}</h6>
    """
  end

  # Direction
  defp footer_direction("horizontal"), do: "footer-horizontal"
  defp footer_direction("vertical"), do: "footer-vertical"
  defp footer_direction(nil), do: nil

  # Placement
  defp footer_placement("center"), do: "footer-center"
  defp footer_placement(nil), do: nil
end
