defmodule DaisyUIComponents.Toast do
  @moduledoc """
  Toast component for displaying notifications positioned at the corners of the page.

  https://daisyui.com/components/toast/

  ## Basic Example:
      <.toast>
        <.alert color="info">New message arrived.</.alert>
      </.toast>

  ## Positioned Example:
      <.toast horizontal="start" vertical="top">
        <.alert color="success">Data saved successfully!</.alert>
      </.toast>
  """

  use DaisyUIComponents, :component

  @doc """
  Renders a toast container for positioning notifications.

  ## Examples

      <.toast>
        <.alert>Default notification</.alert>
      </.toast>

      <.toast horizontal="center" vertical="top">
        <.alert color="info">Centered top notification</.alert>
      </.toast>
  """
  attr :class, :any, default: nil
  attr :horizontal, :string, values: ~w(start center end), doc: "Horizontal alignment"
  attr :vertical, :string, values: ~w(top middle bottom), doc: "Vertical alignment"
  attr :rest, :global
  slot :inner_block

  def toast(assigns) do
    assigns =
      assign(assigns, :class, toast_classes(assigns))

    ~H"""
    <div class={@class} {@rest}>
      {render_slot(@inner_block)}
    </div>
    """
  end

  defp toast_classes(assigns) do
    classes([
      "toast",
      toast_horizontal(assigns[:horizontal]),
      toast_vertical(assigns[:vertical]),
      assigns.class
    ])
  end

  # Horizontal alignment
  defp toast_horizontal("start"), do: "toast-start"
  defp toast_horizontal("center"), do: "toast-center"
  defp toast_horizontal("end"), do: "toast-end"
  defp toast_horizontal(_), do: nil

  # Vertical alignment
  defp toast_vertical("top"), do: "toast-top"
  defp toast_vertical("middle"), do: "toast-middle"
  defp toast_vertical("bottom"), do: "toast-bottom"
  defp toast_vertical(_), do: nil
end
