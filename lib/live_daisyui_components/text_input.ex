defmodule LiveDaisyuiComponents.TextInput do
  @moduledoc """
  TextInput component

  https://daisyui.com/components/input


  """

  use LiveDaisyuiComponents.Component

  attr :type, :string, default: "text"
  attr :color, :string, values: colors()
  attr :bordered, :boolean, default: false
  attr :ghost, :boolean, default: false
  attr :size, :string, values: sizes()
  attr :rest, :global, include: ~w(name value)

  def text_input(assigns) do
    assigns =
      assigns
      |> join_classes_with_rest([
        "input",
        add_class_from_color(assigns[:color], "input"),
        add_class_from_bool(assigns[:bordered], "input-bordered"),
        add_class_from_bool(assigns[:ghost], "input-ghost"),
        add_class_from_size(assigns[:size], "input")
      ])

    ~H"""
    <input type={@type} {@rest} />
    """
  end
end
