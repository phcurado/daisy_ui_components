defmodule LiveDaisyuiComponents.Checkbox do
  @moduledoc """
  Checkbox component

  https://daisyui.com/components/checkbox


  """

  use LiveDaisyuiComponents.Component

  attr :checked, :boolean, default: nil, doc: "the checked flag for checkbox inputs"
  attr :value, :any, default: nil
  attr :color, :string, values: colors()
  attr :size, :string, values: sizes()
  attr :rest, :global, include: ~w(name)

  def checkbox(assigns) do
    assigns =
      assigns
      |> join_classes_with_rest([
        "checkbox",
        add_class_from_color(assigns[:color], "checkbox"),
        add_class_from_size(assigns[:size], "checkbox")
      ])

    ~H"""
    <input type="checkbox" checked={@checked} value={@value} {@rest} />
    """
  end
end
