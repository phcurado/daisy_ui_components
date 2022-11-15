defmodule LiveDaisyuiComponents.Alert do
  @moduledoc """
  Alert component

  https://daisyui.com/components/alert/


  """

  use LiveDaisyuiComponents.Component

  attr :color, :string, values: ~w(info success warning error)
  attr :icon, :boolean, default: true
  attr :label, :string, default: nil
  attr :rest, :global
  slot :inner_block

  def alert(assigns) do
    assigns =
      join_classes_with_rest(assigns, [
        "alert",
        add_class_from_color(assigns[:color], "alert"),
        "shadow-lg"
      ])
      |> assign_new(:color, fn -> nil end)

    ~H"""
    <%= if render?([@label, @inner_block]) do %>
      <div {@rest}>
        <div>
          <%= if @icon do %>
            <%= get_icon(@color) %>
          <% end %>
          <%= if @label do %>
            <span><%= @label %></span>
          <% else %>
            <%= render_slot(@inner_block) %>
          <% end %>
        </div>
      </div>
    <% end %>
    """
  end

  defp get_icon("info") do
    assigns = %{}

    ~H"""
    <svg
      xmlns="http://www.w3.org/2000/svg"
      fill="none"
      viewBox="0 0 24 24"
      class="stroke-current flex-shrink-0 w-6 h-6"
    >
      <path
        stroke-linecap="round"
        stroke-linejoin="round"
        stroke-width="2"
        d="M13 16h-1v-4h-1m1-4h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z"
      >
      </path>
    </svg>
    """
  end

  defp get_icon("success") do
    assigns = %{}

    ~H"""
    <svg
      xmlns="http://www.w3.org/2000/svg"
      class="stroke-current flex-shrink-0 h-6 w-6"
      fill="none"
      viewBox="0 0 24 24"
    >
      <path
        stroke-linecap="round"
        stroke-linejoin="round"
        stroke-width="2"
        d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z"
      />
    </svg>
    """
  end

  defp get_icon("warning") do
    assigns = %{}

    ~H"""
    <svg
      xmlns="http://www.w3.org/2000/svg"
      class="stroke-current flex-shrink-0 h-6 w-6"
      fill="none"
      viewBox="0 0 24 24"
    >
      <path
        stroke-linecap="round"
        stroke-linejoin="round"
        stroke-width="2"
        d="M12 9v2m0 4h.01m-6.938 4h13.856c1.54 0 2.502-1.667 1.732-3L13.732 4c-.77-1.333-2.694-1.333-3.464 0L3.34 16c-.77 1.333.192 3 1.732 3z"
      />
    </svg>
    """
  end

  defp get_icon("error") do
    assigns = %{}

    ~H"""
    <svg
      xmlns="http://www.w3.org/2000/svg"
      class="stroke-current flex-shrink-0 h-6 w-6"
      fill="none"
      viewBox="0 0 24 24"
    >
      <path
        stroke-linecap="round"
        stroke-linejoin="round"
        stroke-width="2"
        d="M10 14l2-2m0 0l2-2m-2 2l-2-2m2 2l2 2m7-2a9 9 0 11-18 0 9 9 0 0118 0z"
      />
    </svg>
    """
  end

  defp get_icon(_nil) do
    assigns = %{}

    ~H"""
    <svg
      xmlns="http://www.w3.org/2000/svg"
      fill="none"
      viewBox="0 0 24 24"
      class="stroke-info flex-shrink-0 w-6 h-6"
    >
      <path
        stroke-linecap="round"
        stroke-linejoin="round"
        stroke-width="2"
        d="M13 16h-1v-4h-1m1-4h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z"
      >
      </path>
    </svg>
    """
  end
end
