defmodule DaisyUIComponents.Label do
  @moduledoc """
  Dropdown component

  https://daisyui.com/components/label/
  """

  use DaisyUIComponents, :component

  @types ~w(input select floating label)
  @positions ~w(start end)

  def types, do: @types
  def positions, do: @positions

  @doc """
  Renders a Label

  ## Examples

      <.label type="input" text="My Label">
        <.input type="text" placeholder="URL" />
      </.label>
  """

  attr :class, :string, default: nil
  attr :type, :string, values: @types
  attr :position, :string, values: @positions
  attr :text, :string, default: nil
  attr :rest, :global
  slot :inner_block, required: true

  def label(assigns) do
    assigns =
      assign(
        assigns,
        :class,
        classes([
          label_type(assigns[:type]),
          assigns.class
        ])
      )
      |> assign_new(:position, fn -> "start" end)

    ~H"""
    <label class={@class} {@rest}>
      <.label_span :if={@text && @position == "start"} text={@text} />
      {render_slot(@inner_block)}
      <.label_span :if={@text && @position == "end"} text={@text} />
    </label>
    """
  end

  defp label_span(assigns) do
    assigns = classes(span_class(assigns.type))

    ~H"""
    <span class={@class} {@rest}>
      {@text}
    </span>
    """
  end

  # Type
  defp label_type("input"), do: "input"
  defp label_type("select"), do: "select"
  defp label_type("floating"), do: "floating-label"
  defp label_type("label"), do: "label"
  defp label_type(nil), do: nil

  # Span class
  defp span_class(type) when type in ["input", "select"], do: "text"
  defp span_class(_type), do: nil
end
