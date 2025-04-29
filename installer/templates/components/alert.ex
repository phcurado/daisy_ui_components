defmodule <%= if not @dev do @web_namespace <> "." end %>DaisyUIComponents.Alert do
  @moduledoc """
  Alert component

  https://daisyui.com/components/alert


  """

  use <%= if not @dev do @web_namespace <> "." end %>DaisyUIComponents, :component

  import <%= if not @dev do @web_namespace <> "." end %>DaisyUIComponents.JSHelpers
  import <%= if not @dev do @web_namespace <> "." end %>DaisyUIComponents.Icon

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

  @doc """
  Renders flash notices.

  ## Examples

      <.flash kind={:info} flash={@flash} />
      <.flash kind={:info} phx-mounted={show("#flash")}>Welcome Back!</.flash>
  """
  attr :id, :string, doc: "the optional id of flash container"
  attr :flash, :map, default: %{}, doc: "the map of flash messages to display"
  attr :title, :string, default: nil
  attr :kind, :atom, values: [:info, :error], doc: "used for styling and flash lookup"
  attr :class, :string, default: nil

  attr :direction, :atom,
    values: [:top_left, :top_right, :bottom_left, :bottom_right],
    default: :top_right

  attr :rest, :global, doc: "the arbitrary HTML attributes to add to the flash container"

  slot :inner_block, doc: "the optional inner block that renders the flash message"

  def flash(%{kind: kind} = assigns) do
    assigns =
      assigns
      |> assign_new(:color, fn ->
        case kind do
          :error -> "error"
          :info -> "success"
        end
      end)
      |> assign_new(:id, fn -> "flash-#{assigns.kind}" end)

    ~H"""
    <.alert
      :if={msg = render_slot(@inner_block) || Phoenix.Flash.get(@flash, @kind)}
      id={@id}
      phx-click={JS.push("lv:clear-flash", value: %{key: @kind}) |> hide("##{@id}")}
      role="alert"
      color={@color}
      class={[
        "w-80 sm:w-96 z-50 rounded-lg p-3 ring-1",
        @direction == :top_left && "fixed top-2 left-2",
        @direction == :top_right && "fixed top-2 right-2",
        @direction == :bottom_left && "fixed bottom-2 left-2",
        @direction == :bottom_right && "fixed bottom-2 right-2",
        @class
      ]}
      {@rest}
    >
      <div :if={@title} class="flex items-center">
        <.icon class="mr-2" name={get_icon(@color)} />
        <div class="flex flex-col">
          <h3 class="font-bold">{@title}</h3>
          <span class="text-xs">{msg}</span>
        </div>
      </div>
      <.icon :if={!@title} class="mr-2" name={get_icon(@color)} />
      <span :if={!@title}>{msg}</span>
      <button type="button" class="group absolute top-1 right-1 p-2" aria-label="close">
        <.icon name="hero-x-mark-solid" class="h-5 w-5 opacity-40 group-hover:opacity-70" />
      </button>
    </.alert>
    """
  end

  attr :id, :string, default: nil, doc: "the optional id of alert container"
  attr :class, :any, default: nil
  attr :color, :string, values: ~w(info success warning error)
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
          assigns.class
        ])
      )

    ~H"""
    <div id={@id} class={@class} {@rest}>
      {render_slot(@inner_block)}
    </div>
    """
  end

  # Icon
  defp get_icon("warning"), do: "hero-exclamation-triangle"
  defp get_icon("success"), do: "hero-check-circle"
  defp get_icon("error"), do: "hero-x-circle"
  defp get_icon(_nil), do: "hero-exclamation-circle"

  # Color
  defp alert_color("info"), do: "alert-info"
  defp alert_color("success"), do: "alert-success"
  defp alert_color("warning"), do: "alert-warning"
  defp alert_color("error"), do: "alert-error"
  defp alert_color(_color), do: nil
end
