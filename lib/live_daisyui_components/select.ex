defmodule LiveDaisyuiComponents.Select do
  @moduledoc """
  Select component

  https://daisyui.com/components/select


  """

  use LiveDaisyuiComponents.Component

  attr :color, :string, values: colors()
  attr :bordered, :boolean, default: false
  attr :ghost, :boolean, default: false
  attr :size, :string, values: sizes()

  attr :options, :list,
    default: [],
    doc: "the options to pass to Phoenix.HTML.Form.options_for_select/2"

  attr :value, :any, default: nil
  attr :prompt, :string, default: nil, doc: "the prompt for select inputs"
  attr :rest, :global, include: ~w(name value multiple)
  slot :option

  def select(assigns) do
    assigns =
      assigns
      |> join_classes_with_rest([
        "select",
        add_class_from_color(assigns[:color], "select"),
        add_class_from_bool(assigns[:bordered], "select-bordered"),
        add_class_from_bool(assigns[:ghost], "select-ghost"),
        add_class_from_size(assigns[:size], "select")
      ])

    ~H"""
    <select {@rest}>
      <option :if={@prompt} value=""><%= @prompt %></option>
      <%= if render?(@option) do %>
        <.option :for={option <- @option} disabled={option[:disabled]} selected={option[:selected]}>
          <%= render_slot(option) %>
        </.option>
      <% else %>
        <%= Phoenix.HTML.Form.options_for_select(@options, @value) %>
      <% end %>
    </select>
    """
  end

  attr :rest, :global, include: ~w(disabled selected)
  slot :inner_block

  def option(assigns) do
    ~H"""
    <option {@rest}>
      <%= render_slot(@inner_block) %>
    </option>
    """
  end
end
