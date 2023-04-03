defmodule LiveDaisyuiComponents.Drawer do
  @moduledoc """
  Drawer component

  https://daisyui.com/components/drawer


  """

  use LiveDaisyuiComponents.Component

  import LiveDaisyuiComponents.Icon
  import LiveDaisyuiComponents.Input


  attr :id, :string, required: true
  attr :current_item_title, :string, default: nil
  slot :item, required: true do
    attr :title, :string, required: true
  end
  slot :inner_block, required: true

  def drawer(assigns) do
    ~H"""
    <div class="drawer drawer-mobile">
      <.input id={@id} type="checkbox" class="drawer-toggle" />

      <div class="drawer-content flex flex-col items-center justify-center">
        <%= render_slot(@inner_block) %>
        <label
          for={@id}
          class="btn btn-square btn-ghost btn-sm lg:hidden fixed left-0 top-0"
        >
          <.icon name="hero-bars-2" />
        </label>
      </div>

      <div class="drawer-side">
        <label for={@id} class="drawer-overlay"></label>
        <ul class="menu p-4 w-80 bg-base-300 text-base-content">
          <li :for={item <- @item} class={"#{@current_item_title == item[:title] && "bg-primary"}"}>
            <%= render_slot(item) %>
          </li>
        </ul>
      </div>
    </div>
    """
  end
end
