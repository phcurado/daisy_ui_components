defmodule DaisyUIComponents.FlashGroup do
  @moduledoc """
  Flash Group component from Phoenix
  """

  use DaisyUIComponents, :component

  import DaisyUIComponents.Alert
  import DaisyUIComponents.JSHelpers
  import DaisyUIComponents.Icon

  @doc """
  Shows the flash group with standard titles and content.

  ## Examples

      <.flash_group flash={@flash} />
  """
  attr :id, :string, default: "flash-group", doc: "the optional id of flash container"
  attr :flash, :map, required: true, doc: "the map of flash messages"

  attr :direction, :atom,
    values: [:top_left, :top_right, :bottom_left, :bottom_right],
    default: :top_right

  def flash_group(assigns) do
    ~H"""
    <div id={@id}>
      <.flash kind={:info} direction={@direction} title="Success!" flash={@flash} />
      <.flash kind={:error} direction={@direction} title="Error!" flash={@flash} />
      <.flash
        id="client-error"
        class="hidden"
        kind={:error}
        direction={@direction}
        title={translate("We can't find the internet")}
        phx-disconnected={show(".phx-client-error #client-error")}
        phx-connected={hide("#client-error")}
      >
        Attempting to reconnect <.icon name="hero-arrow-path" class="ml-1 h-3 w-3 animate-spin" />
      </.flash>

      <.flash
        id="server-error"
        class="hidden"
        kind={:error}
        title="Something went wrong!"
        phx-disconnected={show(".phx-server-error #server-error")}
        phx-connected={hide("#server-error")}
      >
        Hang in there while we get back on track
        <.icon name="hero-arrow-path" class="ml-1 h-3 w-3 animate-spin" />
      </.flash>
    </div>
    """
  end
end
