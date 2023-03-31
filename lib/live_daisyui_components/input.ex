defmodule LiveDaisyuiComponents.Input do
  @moduledoc """
  Generic Input component
  """

  use LiveDaisyuiComponents.Component

  import LiveDaisyuiComponents.Checkbox
  import LiveDaisyuiComponents.Select
  import LiveDaisyuiComponents.Textarea
  import LiveDaisyuiComponents.TextInput

  @doc """
  Renders a generic input based on type.

  ## Examples

      <.input type="email" />
      <.input name="my-input" type="checkbox" value="false" />
  """
  attr :id, :any, default: nil

  attr :type, :string,
    default: "text",
    values: ~w(checkbox color date datetime-local email file hidden month number password
               range radio search select tel text textarea time url week)

  attr :rest, :global,
    include:
      ~w(name value checked prompt options multiple autocomplete cols disabled form list max maxlength min minlength
                pattern placeholder readonly required rows size step)

  slot :inner_block

  def input(%{type: "checkbox"} = assigns) do
    ~H"""
    <.checkbox id={@id} {@rest} />
    """
  end

  def input(%{type: "select"} = assigns) do
    ~H"""
    <.select id={@id} {@rest} />
    """
  end

  def input(%{type: "textarea"} = assigns) do
    ~H"""
    <.textarea id={@id} {@rest} />
    """
  end

  # All other inputs text, datetime-local, url, password, etc. are handled here...
  def input(assigns) do
    ~H"""
    <.text_input id={@id} type={@type} {@rest} />
    """
  end
end
