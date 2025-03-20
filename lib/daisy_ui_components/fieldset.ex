defmodule DaisyUIComponents.Fieldset do
  @moduledoc """
  Label component

  https://daisyui.com/components/fieldset/
  """

  use DaisyUIComponents, :component

  @doc """
  Renders a Fieldset

  ## Examples

      <.fieldset>
        <.fieldset_legend>Login</.fieldset_legend>
        <.fieldset_label>Email</.fieldset_label>
        <.input type="email" placeholder="Email" />
      </.fieldset>
  """

  attr :class, :string, default: nil
  attr :rest, :global
  slot :inner_block, required: true

  def fieldset(assigns) do
    assigns =
      assign(
        assigns,
        :class,
        classes([
          "fieldset",
          assigns.class
        ])
      )

    ~H"""
    <fieldset class={@class} {@rest}>
      {render_slot(@inner_block)}
    </fieldset>
    """
  end

  attr :class, :string, default: nil
  attr :rest, :global
  slot :inner_block, required: true

  def fieldset_legend(assigns) do
    assigns =
      assign(
        assigns,
        :class,
        classes([
          "fieldset-legend",
          assigns.class
        ])
      )

    ~H"""
    <legend class={@class} {@rest}>
      {render_slot(@inner_block)}
    </legend>
    """
  end

  attr :class, :string, default: nil
  attr :for, :string, default: nil
  attr :rest, :global
  slot :inner_block, required: true

  def fieldset_label(assigns) do
    assigns =
      assign(
        assigns,
        :class,
        classes([
          "fieldset-label",
          assigns.class
        ])
      )

    ~H"""
    <label class={@class} for={@for} {@rest}>
      {render_slot(@inner_block)}
    </label>
    """
  end
end
