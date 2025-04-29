defmodule <%= @web_namespace %>.DaisyUIComponents.Navbar do
  @moduledoc """
  Navbar component

  https://daisyui.com/components/navbar/
  """

  use <%= @web_namespace %>.DaisyUIComponents, :component

  attr :class, :any, default: nil
  attr :rest, :global

  slot :navbar_start do
    attr :class, :any
  end

  slot :navbar_center do
    attr :class, :any
  end

  slot :navbar_end do
    attr :class, :any
  end

  slot :inner_block

  def navbar(assigns) do
    ~H"""
    <div class={classes(["navbar", @class])} {@rest}>
      <.navbar_start :for={navbar_start <- @navbar_start} class={Map.get(navbar_start, :class)}>
        {render_slot(navbar_start)}
      </.navbar_start>
      <.navbar_center :for={navbar_center <- @navbar_center} class={Map.get(navbar_center, :class)}>
        {render_slot(navbar_center)}
      </.navbar_center>
      <.navbar_end :for={navbar_end <- @navbar_end} class={Map.get(navbar_end, :class)}>
        {render_slot(navbar_end)}
      </.navbar_end>
      {render_slot(@inner_block)}
    </div>
    """
  end

  attr :class, :any, default: nil
  attr :rest, :global
  slot :inner_block

  def navbar_start(assigns) do
    ~H"""
    <div class={classes(["navbar-start", @class])} {@rest}>
      {render_slot(@inner_block)}
    </div>
    """
  end

  attr :class, :any, default: nil
  attr :rest, :global
  slot :inner_block

  def navbar_center(assigns) do
    ~H"""
    <div class={classes(["navbar-center", @class])} {@rest}>
      {render_slot(@inner_block)}
    </div>
    """
  end

  attr :class, :any, default: nil
  attr :rest, :global
  slot :inner_block

  def navbar_end(assigns) do
    ~H"""
    <div class={classes(["navbar-end", @class])} {@rest}>
      {render_slot(@inner_block)}
    </div>
    """
  end
end
