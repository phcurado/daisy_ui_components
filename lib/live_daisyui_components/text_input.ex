defmodule LiveDaisyuiComponents.TextInput do
  @moduledoc """
  TextInput component

  https://daisyui.com/components/input/


  """

  use LiveDaisyuiComponents.Component

  attr :color, :string, values: colors()
  attr :placeholder, :string
  attr :bordered, :boolean, default: false
  attr :ghost, :boolean, default: false
  attr :size, :string, values: sizes()
  attr :rest, :global

  def text_input(assigns) do
    assigns =
      assigns
      |> assign_new(:placeholder, fn -> nil end)
      |> join_classes_with_rest([
        "input",
        add_class_from_color(assigns[:color], "input"),
        add_class_from_bool(assigns[:bordered], "input-bordered"),
        add_class_from_bool(assigns[:ghost], "input-ghost"),
        add_class_from_size(assigns[:size], "input")
      ])

    ~H"""
    <input type="text" placeholder={@placeholder} {@rest} />
    """
  end
end
