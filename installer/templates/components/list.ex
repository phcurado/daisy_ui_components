defmodule <%= if not @dev do @web_namespace <> "." end %>DaisyUIComponents.List do
  @moduledoc """
  List component

  https://daisyui.com/components/list/
  """

  use <%= if not @dev do @web_namespace <> "." end %>DaisyUIComponents, :component

  @doc """
  Renders a List

  ## Examples

      <.list>
        <:header>Posts</:header>
        <:item title="Title">{@post.title}</:item>
        <:item title="Views">{@post.views}</:item>
      </.list>
  """
  attr :class, :any, default: nil
  attr :rest, :global

  slot :item do
    attr :title, :string
  end

  slot :header

  slot :inner_block

  def list(assigns) do
    assigns =
      assign(
        assigns,
        :class,
        classes([
          "list",
          assigns.class
        ])
      )

    ~H"""
    <ul class={@class} {@rest}>
      <li :if={header = render_slot(@header)} class="p-4 pb-2 text-xs opacity-60 tracking-wide">
        {header}
      </li>
      <.list_row :for={item <- @item}>
        <span :if={item[:title]}>{item[:title]}</span>
        {render_slot(item)}
      </.list_row>
      {render_slot(@inner_block)}
    </ul>
    """
  end

  attr :class, :any, default: nil
  attr :rest, :global

  slot :inner_block

  def list_row(assigns) do
    assigns =
      assign(
        assigns,
        :class,
        classes([
          "list-row",
          assigns.class
        ])
      )

    ~H"""
    <li class={@class} {@rest}>
      {render_slot(@inner_block)}
    </li>
    """
  end
end
