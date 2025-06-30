defmodule <%= if not @dev do @web_namespace <> "." end %>DaisyUIComponents.Form do
  @moduledoc """
  Form component helpers
  """

  use <%= if not @dev do @web_namespace <> "." end %>DaisyUIComponents, :component

  import <%= if not @dev do @web_namespace <> "." end %>DaisyUIComponents.Fieldset
  import <%= if not @dev do @web_namespace <> "." end %>DaisyUIComponents.Icon
  import <%= if not @dev do @web_namespace <> "." end %>DaisyUIComponents.Input

  @doc """
  Renders a simple form.
  This component was extracted from the original [Phoenix CoreComponents](https://github.com/phoenixframework/phoenix/blob/main/installer/templates/phx_web/components/core_components.ex).

  ## Examples

      <.simple_form for={@form} phx-change="validate" phx-submit="save">
        <.input field={@form[:email]} label="Email"/>
        <.input field={@form[:username]} label="Username" />
        <:actions>
          <.button>Save</.button>
        </:actions>
      </.simple_form>
  """
  attr :for, :any, required: true, doc: "the datastructure for the form"
  attr :as, :any, default: nil, doc: "the server side parameter to collect all input under"

  attr :rest, :global,
    include: ~w(autocomplete name rel action enctype method novalidate target),
    doc: "the arbitrary HTML attributes to apply to the form tag"

  slot :inner_block, required: true
  slot :actions, doc: "the slot for form actions, such as a submit button"

  def simple_form(assigns) do
    ~H"""
    <.form :let={f} for={@for} as={@as} {@rest}>
      {render_slot(@inner_block, f)}
      <div :for={action <- @actions} class="mt-2 flex items-center justify-between gap-6">
        {render_slot(action, f)}
      </div>
    </.form>
    """
  end

  @doc """
  Renders an input with label and error messages.

  A `%Phoenix.HTML.Form{}` and field name may be passed to the input
  to build input names and error messages, or all the attributes and
  errors may be passed explicitly.

  ## Examples

      <.form_input field={@form[:email]} type="email" />
      <.form_input name="my-input" errors={["oh no!"]} />
  """
  attr :id, :any, default: nil
  attr :name, :any
  attr :label, :string, default: nil
  attr :value, :any

  attr :color, :string, values: colors() ++ [nil], default: nil

  attr :type, :string,
    default: "text",
    values: ~w(checkbox color date datetime-local email file hidden month number password
               range radio search select tel text textarea time url week checkbox_group)

  attr :field, Phoenix.HTML.FormField,
    doc: "a form field struct retrieved from the form, for example: @form[:email]"

  attr :class, :string, default: nil
  attr :errors, :list, default: []
  attr :checked, :boolean, doc: "the checked flag for checkbox inputs"
  attr :prompt, :string, default: nil, doc: "the prompt for select inputs"
  attr :options, :list, doc: "the options to pass to Phoenix.HTML.Form.options_for_select/2"
  attr :multiple, :boolean, default: false, doc: "the multiple flag for select inputs"

  attr :rest, :global,
    include: ~w(autocomplete cols disabled form list max maxlength min minlength
                pattern placeholder readonly required rows size step)

  slot :inner_block

  def form_input(%{field: %Phoenix.HTML.FormField{} = field} = assigns) do
    errors = if Phoenix.Component.used_input?(field), do: field.errors, else: []

    assigns
    |> assign(field: nil, id: assigns.id || field.id)
    |> assign(:errors, Enum.map(errors, &translate(&1)))
    |> assign_new(:name, fn -> if assigns.multiple, do: field.name <> "[]", else: field.name end)
    |> assign_new(:value, fn -> field.value end)
    |> assign_new(:color, fn -> assigns.errors != [] && "error" end)
    |> form_input()
  end

  def form_input(%{type: "checkbox"} = assigns) do
    assigns =
      assigns
      |> assign_new(:checked, fn ->
        Phoenix.HTML.Form.normalize_value("checkbox", assigns[:value])
      end)

    ~H"""
    <.fieldset class="mt-2">
      <input type="hidden" name={@name} value="false" disabled={@rest[:disabled]} />
      <.fieldset_label for={@id}>
        <.input
          id={@id}
          type="checkbox"
          name={@name}
          value="true"
          checked={@checked}
          class={@class}
          {@rest}
        />

        {@label}
      </.fieldset_label>
      <.error :for={msg <- @errors}>{msg}</.error>
    </.fieldset>
    """
  end

  def form_input(%{type: "checkbox_group"} = assigns) do
    assigns =
      assigns
      |> assign(:multiple, true)
      |> assign(:name, assigns.name <> "[]")
      |> assign_new(:value, fn -> assigns.value || [] end)

    ~H"""
    <.fieldset class="mt-2">
      <input type="hidden" name={@name} value="" disabled={@rest[:disabled]} />
      <div :for={{{label, value}, index} <- Enum.with_index(@options)} class="...">
        <.fieldset_label for={"#{@id}-#{index}"}>
          <.input
            id={"#{@id}-#{index}"}
            type="checkbox"
            name={@name}
            value={value}
            checked={value in @value}
            class={@class}
            {@rest}
          />

          {label}
        </.fieldset_label>
      </div>
      <.error :for={msg <- @errors}>{msg}</.error>
    </.fieldset>
    """
  end

  def form_input(%{type: "radio"} = assigns) do
    assigns =
      assigns
      |> assign_new(:checked, fn ->
        Phoenix.HTML.Form.normalize_value("radio", assigns[:value])
      end)

    ~H"""
    <.fieldset class="mt-2">
      <input type="hidden" name={@name} value="false" disabled={@rest[:disabled]} />
      <.fieldset_label for={@id}>
        <.input
          id={@id}
          type="radio"
          color={@color}
          name={@name}
          value="true"
          checked={@checked}
          class={@class}
          {@rest}
        />

        {@label}
      </.fieldset_label>
      <.error :for={msg <- @errors}>{msg}</.error>
    </.fieldset>
    """
  end

  def form_input(%{type: "select"} = assigns) do
    ~H"""
    <.fieldset class="mt-2">
      <.fieldset_label for={@id}>
        {@label}
      </.fieldset_label>
      <.input
        id={@id}
        type="select"
        name={@name}
        color={@color}
        multiple={@multiple}
        class={[@class, "w-full"]}
        prompt={@prompt}
        options={@options}
        value={@value}
        {@rest}
      />
      <.error :for={msg <- @errors}>{msg}</.error>
    </.fieldset>
    """
  end

  def form_input(%{type: "textarea"} = assigns) do
    ~H"""
    <.fieldset class="mt-2">
      <.fieldset_label for={@id}>
        {@label}
      </.fieldset_label>
      <.input id={@id} type="textarea" name={@name} color={@color} class={[@class, "w-full"]} prompt={@prompt} value={@value} {@rest} />
      <.error :for={msg <- @errors}>{msg}</.error>
    </.fieldset>
    """
  end

  def form_input(assigns) do
    ~H"""
    <.fieldset class="mt-2">
      <.fieldset_label for={@id}>
        {@label}
      </.fieldset_label>
      <.input
        id={@id}
        class={[@class, "w-full"]}
        color={@color}
        type={@type}
        name={@name}
        value={Phoenix.HTML.Form.normalize_value(@type, @value)}
        {@rest}
      />
      <.error :for={msg <- @errors}>{msg}</.error>
    </.fieldset>
    """
  end

  @doc """
  Generates a generic error message.
  """
  attr :field, Phoenix.HTML.FormField,
    doc: "a form field struct retrieved from the form, for example: @form[:email]"

  slot :inner_block

  def error(%{field: %Phoenix.HTML.FormField{} = field} = assigns) do
    errors = if Phoenix.Component.used_input?(field), do: field.errors, else: []

    assigns =
      assigns
      |> assign(:field, nil)
      |> assign(:errors, Enum.map(errors, &translate(&1)))

    ~H"""
    <.error :for={msg <- @errors}>{msg}</.error>
    """
  end

  def error(assigns) do
    ~H"""
    <p class="flex gap-2 text-sm leading-6 text-error">
      <.icon name="hero-exclamation-circle-mini" class="mt-0.5 h-5 w-5 flex-none" />
      {render_slot(@inner_block)}
    </p>
    """
  end
end
