defmodule <%= if not @dev do @web_namespace <> "." end %>DaisyUIComponents.Input do
  @moduledoc """
  Generic Input component
  """

  use <%= if not @dev do @web_namespace <> "." end %>DaisyUIComponents, :component

  import <%= if not @dev do @web_namespace <> "." end %>DaisyUIComponents.Checkbox
  import <%= if not @dev do @web_namespace <> "." end %>DaisyUIComponents.Radio
  import <%= if not @dev do @web_namespace <> "." end %>DaisyUIComponents.Range
  import <%= if not @dev do @web_namespace <> "." end %>DaisyUIComponents.Select
  import <%= if not @dev do @web_namespace <> "." end %>DaisyUIComponents.Textarea
  import <%= if not @dev do @web_namespace <> "." end %>DaisyUIComponents.TextInput

  @doc """
  Renders a generic input based on type.

  ## Examples

      <.input type="email" />
      <.input name="my-input" type="checkbox" value="false" />
  """
  attr :id, :any, default: nil
  attr :name, :any
  attr :label, :string
  attr :value, :any

  attr :type, :string,
    default: "text",
    values: ~w(checkbox color date datetime-local email file hidden month number password
               range radio search select tel text textarea time url week)

  attr :color, :string, values: [nil] ++ colors(), default: nil

  attr :field, Phoenix.HTML.FormField,
    doc: "a form field struct retrieved from the form, for example: @form[:email]"

  attr :class, :any, default: nil
  attr :ghost, :boolean, default: nil
  attr :errors, :list, default: []
  attr :checked, :boolean, doc: "the checked flag for checkbox inputs"
  attr :prompt, :string, default: nil, doc: "the prompt for select inputs"
  attr :options, :list, doc: "the options to pass to Phoenix.HTML.Form.options_for_select/2"
  attr :multiple, :boolean, default: false, doc: "the multiple flag for select inputs"

  attr :rest, :global,
    include: ~w(autocomplete cols disabled form list max maxlength min minlength
                pattern placeholder readonly required rows size step)

  slot :inner_block

  def input(%{field: %Phoenix.HTML.FormField{}} = assigns) do
    # If form field is sent, this components delegates it's implementation to the form_input component
    ~H"""
    <<%= if not @dev do @web_namespace <> "." end %>DaisyUIComponents.Form.form_input {assigns} />
    """
  end

  def input(%{type: "checkbox"} = assigns) do
    assigns =
      assigns
      |> assign_new(:value, fn -> nil end)
      |> assign_new(:name, fn -> nil end)
      |> assign_new(:checked, fn ->
        Phoenix.HTML.Form.normalize_value("checkbox", assigns[:value])
      end)

    ~H"""
    <.checkbox
      id={@id}
      name={@name}
      class={@class}
      color={@color}
      checked={@checked}
      value={@value}
      {@rest}
    />
    """
  end

  def input(%{type: "radio"} = assigns) do
    assigns =
      assigns
      |> assign_new(:value, fn -> nil end)
      |> assign_new(:name, fn -> nil end)
      |> assign_new(:checked, fn ->
        Phoenix.HTML.Form.normalize_value("radio", assigns[:value])
      end)

    ~H"""
    <.radio
      id={@id}
      name={@name}
      class={@class}
      color={@color}
      checked={@checked}
      value={@value}
      {@rest}
    />
    """
  end

  def input(%{type: "select"} = assigns) do
    assigns =
      assigns
      |> assign_new(:name, fn -> nil end)
      |> assign_new(:value, fn -> nil end)

    ~H"""
    <.select
      id={@id}
      name={@name}
      class={@class}
      color={@color}
      ghost={@ghost}
      multiple={@multiple}
      {@rest}
    >
      <option :if={@prompt} value="">{@prompt}</option>
      {Phoenix.HTML.Form.options_for_select(@options, @value)}
    </.select>
    """
  end

  def input(%{type: "textarea"} = assigns) do
    assigns =
      assigns
      |> assign_new(:name, fn -> nil end)
      |> assign_new(:value, fn -> nil end)

    ~H"""
    <.textarea id={@id} name={@name} class={@class} color={@color} ghost={@ghost} {@rest}>
      {Phoenix.HTML.Form.normalize_value(@type, @value)}
    </.textarea>
    """
  end

  def input(%{type: "range"} = assigns) do
    assigns =
      assigns
      |> assign_new(:name, fn -> nil end)
      |> assign_new(:value, fn -> nil end)

    ~H"""
    <.range
      id={@id}
      name={@name}
      class={@class}
      color={@color}
      value={Phoenix.HTML.Form.normalize_value(@type, @value)}
      {@rest}
    />
    """
  end

  # All other inputs text, datetime-local, url, password, etc. are handled here...
  def input(assigns) do
    assigns =
      assigns
      |> assign_new(:name, fn -> nil end)
      |> assign_new(:value, fn -> nil end)

    ~H"""
    <.text_input
      id={@id}
      name={@name}
      class={@class}
      color={@color}
      ghost={@ghost}
      type={@type}
      value={Phoenix.HTML.Form.normalize_value(@type, @value)}
      {@rest}
    />
    """
  end
end
