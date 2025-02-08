defmodule DaisyUIComponents.List do
  @moduledoc """
  This component was extracted from the original [Phoenix CoreComponents](https://github.com/phoenixframework/phoenix/blob/main/installer/templates/phx_web/components/core_components.ex).
  """

  use DaisyUIComponents.Component

  @doc """
  Renders a data list.

  ## Examples

      <.list>
        <:item title="Title"><%= @post.title %></:item>
        <:item title="Views"><%= @post.views %></:item>
      </.list>
  """
  slot :item, required: true do
    attr :title, :string, required: true
  end

  def list(assigns) do
    ~H"""
    <div class="mt-14">
      <dl class="-my-4 divide-y">
        <div :for={item <- @item} class="flex gap-4 py-4 text-sm leading-6 sm:gap-8">
          <dt class="w-1/4 flex-none">{item.title}</dt>
          <dd>{render_slot(item)}</dd>
        </div>
      </dl>
    </div>
    """
  end
end
