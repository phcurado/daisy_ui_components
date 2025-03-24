defmodule DaisyUIComponents.Menu do
  @moduledoc """
  Menu component

  https://daisyui.com/components/menu
  """

  use DaisyUIComponents, :component

  @directions ~w(horizontal vertical)

  @doc """

  Returns all the possible directions in the menu component.

  """
  def directions, do: @directions

  attr :class, :any, default: nil
  attr :direction, :string, values: @directions
  attr :size, :string, values: sizes()
  attr :rest, :global

  slot :item do
    attr :class, :any
  end

  slot :inner_block

  def menu(assigns) do
    assigns =
      assigns
      |> assign(
        :class,
        classes([
          "menu",
          menu_direction(assigns[:direction]),
          menu_size(assigns[:size]),
          assigns.class
        ])
      )

    ~H"""
    <ul class={@class} {@rest}>
      <li :for={item <- @item} class={Map.get(item, :class)}>
        {render_slot(item)}
      </li>

      {render_slot(@inner_block)}
    </ul>
    """
  end

  # Direction
  defp menu_direction("horizontal"), do: "menu-horizontal"
  defp menu_direction("vertical"), do: "menu-vertical"
  defp menu_direction(nil), do: nil

  # Size
  defp menu_size("xs"), do: "menu-xs"
  defp menu_size("sm"), do: "menu-sm"
  defp menu_size("md"), do: "menu-md"
  defp menu_size("lg"), do: "menu-lg"
  defp menu_size("xl"), do: "menu-xl"
  defp menu_size(nil), do: nil
end
