defmodule DaisyUIComponents.Dropdown do
  @moduledoc """
  Dropdown component

  https://daisyui.com/components/dropdown/


  """

  use DaisyUIComponents.Component

  @doc """
  Renders a button group.

  ## Examples

      <.dropdown>
        <summary class="btn m-1">open or close</summary>
        <ul class="menu dropdown-content bg-base-100 rounded-box z-[1] w-52 p-2 shadow">
          <li><a>Item 1</a></li>
          <li><a>Item 2</a></li>
        </ul>
      </.dropdown>
  """
  attr :class, :string, default: nil
  attr :top, :boolean, default: nil
  attr :bottom, :boolean, default: nil
  attr :end, :boolean, default: nil
  attr :left, :boolean, default: nil
  attr :right, :boolean, default: nil
  attr :rest, :global
  slot :inner_block, required: true

  def button_group(assigns) do
    assigns =
      assign(assigns, :class, [
        "dropdown",
        add_class_from_bool(assigns.top, "dropdown-top"),
        add_class_from_bool(assigns.bottom, "dropdown-bottom"),
        assigns.class
      ])

    ~H"""
    <div class={@class} {@rest}>
      <%= render_slot(@inner_block) %>
    </div>
    """
  end

  # Direction
  defp btn_group_direction("vertical"), do: "btn-group-vertical"
  defp btn_group_direction("horizontal"), do: "btn-group-horizontal"
  defp btn_group_direction(_direction), do: nil
end
