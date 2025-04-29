defmodule <%= @web_namespace %>.DaisyUIComponents.Hero do
  @moduledoc """
  Hero component

  https://daisyui.com/components/hero/
  """

  use <%= @web_namespace %>.DaisyUIComponents, :component

  @doc """
  Renders a hero component.

  ## Examples

      <.hero>
        <:content>
          <h1 class="text-5xl font-bold">Hello there</h1>
        </:content>
      </.hero>
  """
  attr :class, :string, default: nil
  attr :rest, :global

  slot :content do
    attr :class, :any
  end

  slot :overlay do
    attr :class, :any
  end

  slot :inner_block

  def hero(assigns) do
    assigns =
      assign(assigns, :class, classes(["hero", assigns.class]))

    ~H"""
    <div class={@class} {@rest}>
      <.hero_overlay :for={overlay <- @overlay} class={overlay[:class]}>
        {render_slot(overlay)}
      </.hero_overlay>
      <.hero_content :for={content <- @content} class={content[:class]}>
        {render_slot(content)}
      </.hero_content>
      {render_slot(@inner_block)}
    </div>
    """
  end

  attr :class, :string, default: nil
  attr :rest, :global
  slot :inner_block

  def hero_content(assigns) do
    assigns =
      assign(assigns, :class, classes(["hero-content", assigns.class]))

    ~H"""
    <div class={@class} {@rest}>
      {render_slot(@inner_block)}
    </div>
    """
  end

  attr :class, :string, default: nil
  attr :rest, :global
  slot :inner_block

  def hero_overlay(assigns) do
    assigns =
      assign(assigns, :class, classes(["hero-overlay", assigns.class]))

    ~H"""
    <div class={@class} {@rest}>
      {render_slot(@inner_block)}
    </div>
    """
  end
end
