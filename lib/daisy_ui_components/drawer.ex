defmodule DaisyUIComponents.Drawer do
  @moduledoc """
  Drawer component

  https://daisyui.com/components/drawer
  """

  use DaisyUIComponents.Component

  attr :selector_id, :string, required: true, doc: "identifier to toggle the modal"
  attr :class, :any, default: nil
  attr :open, :boolean, default: nil, doc: "Forces the drawer to be open"
  attr :end, :boolean, default: nil, doc: "Puts drawer to the right"
  attr :rest, :global

  slot :drawer_content do
    attr :class, :any
  end

  slot :drawer_side do
    attr :class, :any
  end

  slot :inner_block

  def drawer(assigns) do
    assigns =
      assigns
      |> assign(
        :class,
        classes([
          "drawer",
          maybe_add_class(assigns[:open], "drawer-open"),
          maybe_add_class(assigns[:end], "drawer-end"),
          assigns.class
        ])
      )

    ~H"""
    <div class={@class} {@rest}>
      <input id={@selector_id} type="checkbox" class="drawer-toggle" />
      {render_slot(@inner_block)}
      <.drawer_content
        :for={drawer_content <- @drawer_content}
        class={Map.get(drawer_content, :class)}
      >
        {render_slot(drawer_content)}
      </.drawer_content>
      <.drawer_side
        :for={drawer_side <- @drawer_side}
        class={Map.get(drawer_side, :class)}
        selector_id={@selector_id}
      >
        {render_slot(drawer_side)}
      </.drawer_side>
    </div>
    """
  end

  attr :class, :any, default: nil
  attr :rest, :global
  slot :inner_block

  def drawer_content(assigns) do
    ~H"""
    <div class={classes(["drawer-content", @class])} {@rest}>
      {render_slot(@inner_block)}
    </div>
    """
  end

  attr :class, :any, default: nil
  attr :selector_id, :string, required: true, doc: "identifier to toggle the modal"
  attr :rest, :global
  slot :inner_block

  def drawer_side(assigns) do
    ~H"""
    <div class={classes(["drawer-side", @class])} {@rest}>
      <label for={@selector_id} aria-label="close sidebar" class="drawer-overlay"></label>
      {render_slot(@inner_block)}
    </div>
    """
  end
end
