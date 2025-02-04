defmodule DaisyUIComponents.Input do
  @moduledoc """
  Generic Input component
  """

  use DaisyUIComponents.Component

  import DaisyUIComponents.Checkbox
  import DaisyUIComponents.Range
  import DaisyUIComponents.Select
  import DaisyUIComponents.Textarea
  import DaisyUIComponents.TextInput

  @doc """
  Renders a generic input based on type.

  ## Examples

      <.input type="email" />
      <.input name="my-input" type="checkbox" value="false" />
  """
  attr :id, :any, default: nil
  # attr :name, :any
  attr :label, :string
  attr :value, :any, default: nil

  attr :type, :string,
    default: "text",
    values: ~w(checkbox color date datetime-local email file hidden month number password
               range radio search select tel text textarea time url week)

  attr :color, :string, values: [nil] ++ colors(), default: nil

  attr :field, Phoenix.HTML.FormField,
    doc: "a form field struct retrieved from the form, for example: @form[:email]"

  attr :class, :string, default: nil
  attr :bordered, :boolean, default: nil
  attr :errors, :list, default: []
  attr :checked, :boolean, doc: "the checked flag for checkbox inputs"
  attr :prompt, :string, default: nil, doc: "the prompt for select inputs"
  attr :options, :list, doc: "the options to pass to Phoenix.HTML.Form.options_for_select/2"
  attr :multiple, :boolean, default: false, doc: "the multiple flag for select inputs"

  attr :rest, :global,
    include: ~w(name autocomplete cols disabled form list max maxlength min minlength
                pattern placeholder readonly required rows size step)

  slot :inner_block

  def input(%{field: %Phoenix.HTML.FormField{}} = assigns) do
    # by default inputs doesn't come bordered but
    # to match with phoenix defaults, we add border when it's a form field
    bordered =
      if assigns[:bordered] == nil do
        true
      else
        assigns[:bordered]
      end

    assigns = assign(assigns, :bordered, bordered)

    # If form field is sent, this components delegates it's implementation to the form_input component
    ~H"""
    <DaisyUIComponents.Form.form_input {assigns} />
    """
  end

  def input(%{type: "checkbox"} = assigns) do
    assigns =
      assigns
      |> assign_new(:checked, fn ->
        Phoenix.HTML.Form.normalize_value("checkbox", assigns[:value])
      end)

    ~H"""
    <.checkbox id={@id} class={@class} color={@color} checked={@checked} value={@value} {@rest} />
    """
  end

  def input(%{type: "select"} = assigns) do
    ~H"""
    <.select id={@id} class={@class} color={@color} bordered={@bordered} multiple={@multiple} {@rest}>
      <option :if={@prompt} value="">{@prompt}</option>
      {Phoenix.HTML.Form.options_for_select(@options, @value)}
    </.select>
    """
  end

  def input(%{type: "textarea"} = assigns) do
    ~H"""
    <.textarea
      id={@id}
      class={@class}
      color={@color}
      bordered={@bordered}
      value={Phoenix.HTML.Form.normalize_value(@type, @value)}
      {@rest}
    />
    """
  end

  def input(%{type: "range"} = assigns) do
    ~H"""
    <.range
      id={@id}
      class={@class}
      color={@color}
      value={Phoenix.HTML.Form.normalize_value(@type, @value)}
      {@rest}
    />
    """
  end

  # All other inputs text, datetime-local, url, password, etc. are handled here...
  def input(assigns) do
    ~H"""
    <.text_input
      id={@id}
      class={@class}
      color={@color}
      bordered={@bordered}
      type={@type}
      value={Phoenix.HTML.Form.normalize_value(@type, @value)}
      {@rest}
    />
    """
  end
end
