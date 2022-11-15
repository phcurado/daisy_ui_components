defmodule LiveDaisyuiComponents.Checkbox do
  @moduledoc """
  Checkbox component

  https://daisyui.com/components/checkbox/


  """

  use LiveDaisyuiComponents.Component

  attr :value, :any
  attr :color, :string, values: colors()
  attr :size, :string, values: sizes()
  attr :rest, :global

  def checkbox(assigns) do
    assigns =
      join_classes_with_rest(assigns, [
        "checkbox",
        add_class_from_color(assigns[:color], "checkbox"),
        add_class_from_size(assigns[:size], "checkbox")
      ])

    ~H"""
    <input type="checkbox" {@rest} />
    """
  end
end
