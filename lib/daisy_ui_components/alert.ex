defmodule DaisyUIComponents.Alert do
  @moduledoc """
  Alert component

  https://daisyui.com/components/alert
  """

  use DaisyUIComponents, :component

  attr :id, :string, default: nil, doc: "the optional id of alert container"
  attr :class, :any, default: nil
  attr :color, :string, values: ~w(info success warning error)
  attr :soft, :boolean, default: false
  attr :outline, :boolean, default: false
  attr :dash, :boolean, default: false
  attr :direction, :string, values: ~w(vertical horizontal)
  attr :rest, :global
  slot :inner_block

  def alert(assigns) do
    assigns =
      assign(
        assigns,
        :class,
        classes([
          "alert",
          alert_color(assigns[:color]),
          maybe_add_class(assigns[:soft], "alert-soft"),
          maybe_add_class(assigns[:outline], "alert-outline"),
          maybe_add_class(assigns[:dash], "alert-dash"),
          alert_direction(assigns[:direction]),
          assigns.class
        ])
      )

    ~H"""
    <div id={@id} class={@class} {@rest}>
      {render_slot(@inner_block)}
    </div>
    """
  end

  # Direction
  defp alert_direction("vertical"), do: "alert-vertical"
  defp alert_direction("horizontal"), do: "alert-horizontal"
  defp alert_direction(nil), do: nil

  # Color
  defp alert_color("info"), do: "alert-info"
  defp alert_color("success"), do: "alert-success"
  defp alert_color("warning"), do: "alert-warning"
  defp alert_color("error"), do: "alert-error"
  defp alert_color(_color), do: nil
end
