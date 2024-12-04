defmodule DaisyUIComponents.ButtonGroup do
  @moduledoc """
  Button Group component

  https://daisyui.com/components/button-group/


  """

  use DaisyUIComponents.Component

  @doc """
  Renders a button group.

  ## Examples

      <.button_group>
        <.button active>Button</.button>
        <.button>Button</.button>
        <.button>Button</.button>
      </.button_group>
  """
  attr :class, :string, default: nil
  attr :direction, :string, values: directions()
  attr :rest, :global
  slot :inner_block, required: true

  def button_group(assigns) do
    assigns =
      assign(assigns, :class, [
        "btn-group",
        btn_group_direction(assigns[:direction]),
        assigns.class
      ])

    ~H"""
    <div class={@class} {@rest}>
      {render_slot(@inner_block)}
    </div>
    """
  end

  # Direction
  defp btn_group_direction("vertical"), do: "btn-group-vertical"
  defp btn_group_direction("horizontal"), do: "btn-group-horizontal"
  defp btn_group_direction(_direction), do: nil
end
