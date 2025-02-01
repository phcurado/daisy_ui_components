defmodule DaisyUIComponents.Navbar do
  @moduledoc """
  Navbar component

  https://daisyui.com/components/navbar/


  """

  use DaisyUIComponents.Component

  attr :class, :any, default: nil
  attr :rest, :global
  slot :inner_block

  def navbar(assigns) do
    ~H"""
    <div class={classes(["navbar", @class])} {@rest}>
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
