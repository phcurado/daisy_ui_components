defmodule LiveDaisyuiComponents.Navbar do
  @moduledoc """
  Navbar component

  https://daisyui.com/components/navbar/


  """

  use LiveDaisyuiComponents.Component

  attr :rest, :global
  slot :inner_block

  def navbar(assigns) do
    assigns = join_classes_with_rest(assigns, ["navbar"])

    ~H"""
    <div {@rest}>
      <%= render_slot(@inner_block) %>
    </div>
    """
  end

  attr :rest, :global
  slot :inner_block

  def navbar_start(assigns) do
    assigns = join_classes_with_rest(assigns, ["navbar-start"])

    ~H"""
    <div {@rest}>
      <%= render_slot(@inner_block) %>
    </div>
    """
  end

  attr :rest, :global
  slot :inner_block

  def navbar_center(assigns) do
    assigns = join_classes_with_rest(assigns, ["navbar-center"])

    ~H"""
    <div {@rest}>
      <%= render_slot(@inner_block) %>
    </div>
    """
  end

  attr :rest, :global
  slot :inner_block

  def navbar_end(assigns) do
    assigns = join_classes_with_rest(assigns, ["navbar-end"])

    ~H"""
    <div {@rest}>
      <%= render_slot(@inner_block) %>
    </div>
    """
  end
end
