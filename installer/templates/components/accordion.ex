defmodule <%= if not @dev do @web_namespace <> "." end %>DaisyUIComponents.Accordion do
  @moduledoc """
  Accordion component

  https://daisyui.com/components/accordion/
  """

  use <%= if not @dev do @web_namespace <> "." end %>DaisyUIComponents, :component

  @doc """
  Renders an accordion.

  ## Examples

      <.accordion>
        <:title>Title</:title>
        Content goes here
      </.accordion>
  """

  attr :class, :any, default: nil
  attr :name, :string
  attr :arrow, :boolean, default: false
  attr :plus, :boolean, default: false
  attr :open, :boolean, default: false
  attr :close, :boolean, default: false
  attr :rest, :global

  slot :title, required: true
  slot :inner_block, required: true

  def accordion(assigns) do
    assigns =
      assigns
      |> assign(
        :class,
        classes([
          "collapse",
          maybe_add_class(assigns[:arrow], "collapse-arrow"),
          maybe_add_class(assigns[:plus], "collapse-plus"),
          maybe_add_class(assigns[:open], "collapse-open"),
          maybe_add_class(assigns[:close], "collapse-close"),
          assigns.class
        ])
      )
      |> assign_new(:name, fn -> "accordion-#{System.unique_integer([:positive])}" end)

    ~H"""
    <div class={@class} {@rest}>
      <input type="radio" name={@name} />

      <div class="collapse-title">
        {render_slot(@title)}
      </div>

      <div class="collapse-content">
        {render_slot(@inner_block)}
      </div>
    </div>
    """
  end
end
