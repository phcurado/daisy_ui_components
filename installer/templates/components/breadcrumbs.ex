defmodule  <%= @web_namespace %>.DaisyUIComponents.Breadcrumbs do
  @moduledoc """
  Stat component

  https://daisyui.com/components/stat
  """

  use <%= @web_namespace %>.DaisyUIComponents, :component

  import DaisyUIComponents.Icon

  attr :class, :any, default: nil
  attr :rest, :global

  slot :item do
    attr :icon, :string
    attr :path, :string
  end

  slot :inner_block

  def breadcrumbs(assigns) do
    ~H"""
    <div class={classes(["breadcrumbs", @class])} {@rest}>
      <ul :if={render?(@item)}>
        <%%= for item <- @item do %>
          <li>
            <.render_link path={item[:path]}>
              <.render_icon icon={item[:icon]} />
              {render_slot(item)}
            </.render_link>
          </li>
        <%% end %>
      </ul>

      {render_slot(@inner_block)}
    </div>
    """
  end

  defp render_link(%{path: nil} = assigns) do
    ~H"""
    {render_slot(@inner_block)}
    """
  end

  defp render_link(assigns) do
    ~H"""
    <.link :if={@path} navigate={@path}>
      {render_slot(@inner_block)}
    </.link>
    """
  end

  defp render_icon(assigns) do
    ~H"""
    <.icon :if={@icon} name={@icon} class="w-4 h-4 mr-2" />
    """
  end
end
