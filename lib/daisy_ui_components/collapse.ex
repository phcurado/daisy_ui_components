defmodule DaisyUIComponents.Collapse do
  @moduledoc """
  Collapse component

  https://daisyui.com/components/collapse/
  """

  use DaisyUIComponents, :component

  @doc """
  Renders a Collapse.

  ## Examples

      <.collapse checkbox>
        <:title>Title</:title>
        Content goes here
      </.collapse>
  """

  attr :class, :any, default: nil

  attr :checkbox, :boolean,
    default: false,
    doc:
      "This collapse works with checkbox instead of focus. It needs to get clicked again to get closed."

  attr :arrow, :boolean, default: false
  attr :plus, :boolean, default: false
  attr :open, :boolean, default: false
  attr :close, :boolean, default: false
  attr :rest, :global

  slot :title, required: true
  slot :inner_block, required: true

  def collapse(assigns) do
    assigns =
      assign(
        assigns,
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

    ~H"""
    <div tabindex="0" class={@class} {@rest}>
      <input :if={@checkbox} type="checkbox" />

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
