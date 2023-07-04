defmodule LiveDaisyuiComponents.Drawer do
  @moduledoc """
  Drawer component

  https://daisyui.com/components/drawer


  """

  use LiveDaisyuiComponents.Component

  import LiveDaisyuiComponents.Icon
  import LiveDaisyuiComponents.Input

  attr :id, :string, required: true
  attr :class, :any, default: nil
  slot :page_content
  slot :inner_block, required: true

  def drawer(assigns) do
    ~H"""
    <div class={join_classes("drawer", @class)}>
      <.input id={@id} type="checkbox" class="drawer-toggle" />
      <div class="drawer-content flex flex-col">
        <label for={@id} class="btn btn-ghost lg:hidden justify-start ">
          <.icon name="hero-bars-3-center-left" class="h-5 w-5" />
        </label>
        <%= render_slot(@page_content) %>
      </div>
      <%= render_slot(@inner_block) %>
    </div>
    """
  end

  attr :drawer_id, :string, required: true
  attr :class, :any, default: nil

  slot :inner_block, required: true

  def drawer_side(assigns) do
    ~H"""
    <div class={join_classes("drawer-side", @class)}>
      <label for={@drawer_id} class="drawer-overlay"></label>
      <%= render_slot(@inner_block) %>
    </div>
    """
  end
end
