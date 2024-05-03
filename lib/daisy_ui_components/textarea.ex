defmodule DaisyUIComponents.Textarea do
  @moduledoc """
  Textarea component

  https://daisyui.com/components/textarea


  """

  use DaisyUIComponents.Component

  attr :value, :any, default: nil
  attr :color, :string, values: colors()
  attr :bordered, :boolean, default: false
  attr :ghost, :boolean, default: false
  attr :size, :string, values: sizes()
  attr :rest, :global, include: ~w(name)
  slot :inner_block

  def textarea(assigns) do
    assigns =
      assigns
      |> join_classes_with_rest([
        "textarea",
        add_class_from_bool(assigns[:bordered], "textarea-bordered"),
        add_class_from_bool(assigns[:ghost], "textarea-ghost"),
        textarea_color(assigns[:color]),
        textarea_size(assigns[:size])
      ])

    ~H"""
    <textarea {@rest}>
    <%= if render?(@inner_block) do %>
      <%= render_slot(@inner_block) %>
    <% else %>
        <%= @value %>
    <% end %>
    </textarea>
    """
  end

  # Color
  defp textarea_color("primary"), do: "textarea-primary"
  defp textarea_color("secondary"), do: "textarea-secondary"
  defp textarea_color("accent"), do: "textarea-accent"
  defp textarea_color("info"), do: "textarea-info"
  defp textarea_color("success"), do: "textarea-success"
  defp textarea_color("warning"), do: "textarea-warning"
  defp textarea_color("error"), do: "textarea-error"
  defp textarea_color(_color), do: nil

  # Size
  defp textarea_size("xs"), do: "textarea-xs"
  defp textarea_size("sm"), do: "textarea-sm"
  defp textarea_size("md"), do: "textarea-md"
  defp textarea_size("lg"), do: "textarea-lg"
  defp textarea_size(_size), do: nil
end
