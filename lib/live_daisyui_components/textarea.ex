defmodule LiveDaisyuiComponents.Textarea do
  @moduledoc """
  Textarea component

  https://daisyui.com/components/textarea


  """

  use LiveDaisyuiComponents.Component

  attr :color, :string, values: colors()
  attr :bordered, :boolean, default: false
  attr :ghost, :boolean, default: false
  attr :size, :string, values: sizes()
  attr :rest, :global

  def textarea(assigns) do
    assigns =
      assigns
      |> join_classes_with_rest([
        "textarea",
        add_class_from_color(assigns[:color], "textarea"),
        add_class_from_bool(assigns[:bordered], "textarea-bordered"),
        add_class_from_bool(assigns[:ghost], "textarea-ghost"),
        add_class_from_size(assigns[:size], "textarea")
      ])

    ~H"""
    <textarea {@rest} />
    """
  end
end
