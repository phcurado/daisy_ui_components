defmodule DaisyUIComponents.Button do
  @moduledoc """
  Button component

  https://daisyui.com/components/button/


  """

  use DaisyUIComponents.Component

  @doc """
  Renders a button.

  ## Examples

      <.button>Send!</.button>
      <.button phx-click="go" class="ml-2">Send!</.button>
  """
  attr :class, :string, default: nil
  attr :color, :string, values: colors() ++ ["neutral"]
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
  attr :rest, :global, include: ~w(form name value)
  slot :inner_block, required: true

  def button(assigns) do
    assigns =
      assign(assigns, :class, [
        "btn",
        btn_color(assigns[:color]),
        add_class_from_bool(assigns[:ghost], "btn-ghost"),
        add_class_from_bool(assigns[:link], "btn-link"),
        add_class_from_bool(assigns[:outline], "btn-outline"),
        add_class_from_bool(assigns[:active], "btn-active"),
        add_class_from_bool(assigns[:disabled], "btn-disabled"),
        add_class_from_bool(assigns[:glass], "btn-glass"),
        add_class_from_bool(assigns[:loading], "loading"),
        add_class_from_bool(assigns[:wide], "btn-wide"),
        add_class_from_bool(assigns[:block], "btn-block"),
        add_class_from_bool(assigns[:no_animation], "no-animation"),
        btn_size(assigns[:size]),
        btn_shape(assigns[:shape]),
        assigns.class
      ])

    ~H"""
    <button class={@class} {@rest}>
      <%= render_slot(@inner_block) %>
    </button>
    """
  end

  # Color
  defp btn_color("neutral"), do: "btn-neutral"
  defp btn_color("primary"), do: "btn-primary"
  defp btn_color("secondary"), do: "btn-secondary"
  defp btn_color("accent"), do: "btn-accent"
  defp btn_color("info"), do: "btn-info"
  defp btn_color("success"), do: "btn-success"
  defp btn_color("warning"), do: "btn-warning"
  defp btn_color("error"), do: "btn-error"
  defp btn_color(_color), do: nil

  # Size
  defp btn_size("xs"), do: "btn-xs"
  defp btn_size("sm"), do: "btn-sm"
  defp btn_size("md"), do: "btn-md"
  defp btn_size("lg"), do: "btn-lg"
  defp btn_size(_size), do: nil

  # Shape
  defp btn_shape("circle"), do: "btn-circle"
  defp btn_shape("square"), do: "btn-square"
  defp btn_shape(nil), do: nil
end
