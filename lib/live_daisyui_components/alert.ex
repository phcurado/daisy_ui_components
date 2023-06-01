defmodule LiveDaisyuiComponents.Alert do
  @moduledoc """
  Alert component

  https://daisyui.com/components/alert


  """

  use LiveDaisyuiComponents.Component

  import LiveDaisyuiComponents.Icon

  alias Phoenix.LiveView.JS

  @doc """
  Shows the flash group with standard titles and content.

  ## Examples

      <.flash_group flash={@flash} />
  """
  attr :flash, :map, required: true, doc: "the map of flash messages"

  attr :direction, :atom,
    values: [:top_left, :top_right, :bottom_left, :bottom_right],
    default: :top_right

  def flash_group(assigns) do
    ~H"""
    <.flash kind={:info} direction={@direction} title="Success!" flash={@flash} />
    <.flash kind={:error} direction={@direction} title="Error!" flash={@flash} />
    <.flash
      id="disconnected"
      class="hidden"
      kind={:error}
      direction={@direction}
      title={translate("We can't find the internet")}
      phx-disconnected={show("#disconnected")}
      phx-connected={hide("#disconnected")}
    >
      Attempting to reconnect <.icon name="hero-arrow-path" class="ml-1 h-3 w-3 animate-spin" />
    </.flash>
    """
  end

  @doc """
  Renders flash notices.

  ## Examples

      <.flash kind={:info} flash={@flash} />
      <.flash kind={:info} phx-mounted={show("#flash")}>Welcome Back!</.flash>
  """
  attr :id, :string, default: "flash", doc: "the optional id of flash container"
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
      assign_new(assigns, :color, fn ->
        case kind do
          :error -> "error"
          :info -> "success"
        end
      end)

    ~H"""
    <.alert
      :if={msg = render_slot(@inner_block) || Phoenix.Flash.get(@flash, @kind)}
      id={@id}
      phx-click={JS.push("lv:clear-flash", value: %{key: @kind}) |> hide("##{@id}")}
      role="alert"
      title={@title}
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
      <%= msg %>
      <button type="button" class="group absolute top-1 right-1 p-2" aria-label="close">
        <.icon name="hero-x-mark-solid" class="h-5 w-5 opacity-40 group-hover:opacity-70" />
      </button>
    </.alert>
    """
  end

  attr :color, :string, values: ~w(info success warning error)
  attr :icon, :boolean, default: true
  attr :title, :string, default: nil
  attr :label, :string, default: nil
  attr :rest, :global
  slot :inner_block

  def alert(assigns) do
    assigns =
      join_classes_with_rest(assigns, [
        "alert",
        alert_color(assigns[:color]),
        "shadow-lg",
        "items-start"
      ])
      |> assign_new(:color, fn -> nil end)

    ~H"""
    <div {@rest}>
      <.icon :if={@icon} name={get_icon(@color)} />
      <div>
        <h3 :if={@title} class="font-bold"><%= @title %></h3>
        <p if={@label} class="text-xs"><%= @label %></p>
        <%= render_slot(@inner_block) %>
      </div>
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
