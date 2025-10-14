defmodule DaisyUIComponents.Accordion do
  @moduledoc """
  Accordion component

  https://daisyui.com/components/accordion/
  """

  use DaisyUIComponents, :component

  @doc """
  Renders an accordion.

  ## Examples

      <.accordion name="my-accordion">
        <:title>Title</:title>
        <:content>Content goes here</:content>
      </.accordion>
      <.accordion name="my-accordion">
        <:title>Second Title</:title>
        <:content>Second Content</:content>
      </.accordion>
  """

  attr :class, :any, default: nil
  attr :name, :string, required: true
  attr :arrow, :boolean, default: false
  attr :plus, :boolean, default: false
  attr :open, :boolean, default: false
  attr :close, :boolean, default: false
  attr :rest, :global

  slot :title, required: true do
    attr :class, :any
  end
  slot :content, required: true do
    attr :class, :any
  end

  def accordion(assigns) do
    assigns =
      assigns
      |> assign(
        :class,
        classes([
          "collapse",
          maybe_add_class(assigns[:arrow], "collapse-arrow"),
          maybe_add_class(assigns[:plus], "collapse-plus"),
          maybe_add_class(assigns[:open], "collapse-open"),
          maybe_add_class(assigns[:close], "collapse-close"),
          assigns.class
        ])
      )

    ~H"""
    <div class={@class} {@rest}>
      <input type="radio" name={@name} />

      <.accordion_title :for={title <- @title} class={Map.get(title, :class, nil)}>
        {render_slot(title)}
      </.accordion_title>
      <.accordion_content :for={content <- @content} class={Map.get(content, :class, nil)}>
        {render_slot(content)}
      </.accordion_content>
    </div>
    """
  end

  attr :class, :any, default: nil
  attr :rest, :global
  slot :inner_block
  def accordion_title(assigns) do
    ~H"""
    <div class={classes(["collapse-title", @class])}>
      {render_slot(@inner_block)}
    </div>
    """
  end

  attr :class, :any, default: nil
  attr :rest, :global
  slot :inner_block
  def accordion_content(assigns) do
    ~H"""
    <div class={classes(["collapse-content", @class])}>
      {render_slot(@inner_block)}
    </div>
    """
  end
end
