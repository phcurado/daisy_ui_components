defmodule <%= @web_namespace %>.DaisyUIComponents.Dropdown do
  @moduledoc """
  Dropdown component

  https://daisyui.com/components/dropdown/
  """

  use <%= @web_namespace %>.DaisyUIComponents, :component

  @doc """
  Renders a  dropdown

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
  attr :direction, :string, values: directions()
  attr :align, :string, values: ["end"]
  attr :hover, :boolean, default: nil
  attr :open, :boolean, default: nil
  attr :rest, :global
  slot :inner_block, required: true

  def dropdown(assigns) do
    assigns =
      assign(assigns, :class, [
        "dropdown",
        dropdown_direction(assigns[:direction]),
        dropdown_align(assigns[:align]),
        maybe_add_class(assigns.hover, "dropdown-hover"),
        maybe_add_class(assigns.open, "dropdown-open"),
        assigns.class
      ])

    ~H"""
    <div class={@class} {@rest}>
      {render_slot(@inner_block)}
    </div>
    """
  end

  # Direction
  defp dropdown_direction("top"), do: "dropdown-top"
  defp dropdown_direction("bottom"), do: "dropdown-bottom"
  defp dropdown_direction("left"), do: "dropdown-left"
  defp dropdown_direction("right"), do: "dropdown-right"
  defp dropdown_direction(nil), do: nil

  # Align
  defp dropdown_align("end"), do: "dropdown-end"
  defp dropdown_align(nil), do: nil
end
