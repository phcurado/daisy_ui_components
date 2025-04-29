defmodule <%= @web_namespace %>.DaisyUIComponents.Back do
  @moduledoc """
  This component was extracted from the original [Phoenix CoreComponents](https://github.com/phoenixframework/phoenix/blob/main/installer/templates/phx_web/components/core_components.ex).
  """

  use <%= @web_namespace %>.DaisyUIComponents, :component

  import <%= @web_namespace %>.DaisyUIComponents.Icon

  @doc """
  Renders a back navigation link.

  ## Examples

      <.back navigate={~p"/posts"}>Back to posts</.back>
  """
  attr :navigate, :any, required: true
  slot :inner_block, required: true

  def back(assigns) do
    ~H"""
    <div class="mt-16">
      <.link navigate={@navigate} class="text-sm font-semibold leading-6">
        <.icon name="hero-arrow-left-solid" class="h-3 w-3" />
        {render_slot(@inner_block)}
      </.link>
    </div>
    """
  end
end
