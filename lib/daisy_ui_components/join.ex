defmodule DaisyUIComponents.Join do
  @moduledoc """
  Button Group component

  https://daisyui.com/components/join/


  """

  use DaisyUIComponents.Component

  @doc """
  Join elements

  ## Examples

      <.join>
        <.button class="join-item" active>Button</.button>
        <.button class="join-item">Button</.button>
        <.button class="join-item">Button</.button>
      </.join>
  """
  attr :class, :string, default: nil
  attr :direction, :string, values: directions()
  attr :rest, :global
  slot :inner_block, required: true

  def join(assigns) do
    assigns =
      assign(assigns, :class, [
        "join",
        join_direction(assigns[:direction]),
        assigns.class
      ])

    ~H"""
    <div class={@class} {@rest}>
      {render_slot(@inner_block)}
    </div>
    """
  end

  # Direction
  defp join_direction("vertical"), do: "join-vertical"
  defp join_direction("horizontal"), do: "join-horizontal"
  defp join_direction(_direction), do: nil
end
