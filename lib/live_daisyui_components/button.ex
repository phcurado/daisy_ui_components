defmodule LiveDaisyuiComponents.Button do
  @moduledoc """
  Button component

  https://daisyui.com/components/button/


  """

  use LiveDaisyuiComponents.Component

  attr :color, :string, values: colors()
  attr :ghost, :boolean, default: false
  attr :link, :boolean, default: false
  attr :outline, :boolean, default: false
  attr :active, :boolean, default: false
  attr :disabled, :boolean, default: false
  attr :glass, :boolean, default: false
  attr :loading, :boolean, default: false
  attr :no_animation, :boolean, default: false
  attr :size, :string, values: sizes()
  attr :wide, :boolean, default: false
  attr :block, :boolean, default: false
  attr :shape, :string, values: ~w(circle square)
  attr :label, :string, default: nil
  attr :rest, :global
  slot :inner_block

  def button(assigns) do
    assigns =
      join_classes_with_rest(assigns, [
        "btn",
        add_class_from_color(assigns[:color], "btn"),
        add_class_from_bool(assigns[:ghost], "btn-ghost"),
        add_class_from_bool(assigns[:link], "btn-link"),
        add_class_from_bool(assigns[:outline], "btn-outline"),
        add_class_from_bool(assigns[:active], "btn-active"),
        add_class_from_bool(assigns[:disabled], "btn-disabled"),
        add_class_from_bool(assigns[:glass], "btn-glass"),
        add_class_from_bool(assigns[:loading], "loading"),
        add_class_from_bool(assigns[:wide], "btn-wide"),
        add_class_from_bool(assigns[:block], "btn-wide"),
        add_class_from_bool(assigns[:no_animation], "no-animation"),
        add_class_from_size(assigns[:size], "btn"),
        add_class_from_shape(assigns[:shape])
      ])

    ~H"""
    <button {@rest}>
      <%= if @label do %>
        <%= @label %>
      <% else %>
        <%= render_slot(@inner_block) %>
      <% end %>
    </button>
    """
  end

  defp add_class_from_shape("circle"), do: "btn-circle"
  defp add_class_from_shape("square"), do: "btn-square"
  defp add_class_from_shape(nil), do: nil
end
