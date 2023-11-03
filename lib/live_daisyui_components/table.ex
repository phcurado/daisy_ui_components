defmodule LiveDaisyuiComponents.Table do
  @moduledoc """
  Table component

  https://daisyui.com/components/table/


  """

  use LiveDaisyuiComponents.Component

  @doc ~S"""
  Renders a table with generic styling.

  ## Examples

      <.table id="users" rows={@users}>
        <:col :let={user} label="id"><%= user.id %></:col>
        <:col :let={user} label="username"><%= user.username %></:col>
      </.table>

  or declaring the table components

    <.table id="users">
      <.thead>
        <.tr>
          <.th>id</.th>
          <.th>username</.th>
        </.tr>
      </.thead>
      <.tbody>
        <.tr :for={user <- @users}>
          <.td><%= user.id %></.td>
          <.td><%= user.username %></.td>
        </.tr>
      </.tbody>
    </.table>
  """
  attr :id, :string, default: nil
  attr :rows, :list
  attr :row_id, :any, default: nil, doc: "the function for generating the row id"
  attr :row_click, :any, default: nil, doc: "the function for handling phx-click on each row"

  attr :row_item, :any,
    default: &Function.identity/1,
    doc: "the function for mapping each row before calling the :col and :action slots"

  slot :col do
    attr :label, :string
  end

  slot :action, doc: "the slot for showing user actions in the last table column"

  attr :zebra, :boolean, default: false
  attr :size, :string, values: sizes()
  attr :rest, :global
  slot :inner_block

  def table(%{rows: _rows} = assigns) do
    assigns =
      join_classes_with_rest(assigns, [
        "table",
        add_class_from_bool(assigns[:zebra], "table-zebra"),
        table_size(assigns[:size])
      ])

    assigns =
      with %{rows: %Phoenix.LiveView.LiveStream{}} <- assigns do
        assign(assigns, row_id: assigns.row_id || fn {id, _item} -> id end)
      end

    ~H"""
    <div class="overflow-x-auto">
      <table {@rest}>
        <.thead>
          <.tr>
            <.th :for={col <- @col}><%= col[:label] %></.th>
            <.th :if={@action != []}>
              <span class="sr-only"><span class="sr-only"><%= translate("Actions") %></span></span>
            </.th>
          </.tr>
        </.thead>
        <.tbody id={@id} phx-update={match?(%Phoenix.LiveView.LiveStream{}, @rows) && "stream"}>
          <.tr :for={row <- @rows} id={@row_id && @row_id.(row)}>
            <.td
              :for={col <- @col}
              phx-click={@row_click && @row_click.(row)}
              class={[@row_click && "hover:cursor-pointer"]}
            >
              <%= render_slot(col, @row_item.(row)) %>
            </.td>
            <.td :if={@action != []}>
              <span :for={action <- @action}>
                <%= render_slot(action, @row_item.(row)) %>
              </span>
            </.td>
          </.tr>
        </.tbody>
      </table>
    </div>
    """
  end

  def table(assigns) do
    assigns =
      join_classes_with_rest(assigns, [
        "table",
        add_class_from_bool(assigns[:zebra], "table-zebra"),
        table_size(assigns[:size])
      ])

    ~H"""
    <div class="overflow-x-auto">
      <table {@rest}>
        <%= render_slot(@inner_block) %>
      </table>
    </div>
    """
  end

  attr :active, :boolean, default: false
  attr :hover, :boolean, default: false
  attr :rest, :global
  slot :inner_block

  def tr(assigns) do
    assigns =
      join_classes_with_rest(assigns, [
        add_class_from_bool(assigns[:active], "active"),
        add_class_from_bool(assigns[:hover], "hover")
      ])

    ~H"""
    <tr {@rest}>
      <%= render_slot(@inner_block) %>
    </tr>
    """
  end

  attr :rest, :global
  slot :inner_block

  def td(assigns) do
    ~H"""
    <td {@rest}>
      <%= render_slot(@inner_block) %>
    </td>
    """
  end

  attr :rest, :global
  slot :inner_block

  def th(assigns) do
    ~H"""
    <th {@rest}>
      <%= render_slot(@inner_block) %>
    </th>
    """
  end

  attr :rest, :global
  slot :inner_block

  def thead(assigns) do
    ~H"""
    <thead {@rest}>
      <%= render_slot(@inner_block) %>
    </thead>
    """
  end

  attr :rest, :global
  slot :inner_block

  def tbody(assigns) do
    ~H"""
    <tbody {@rest}>
      <%= render_slot(@inner_block) %>
    </tbody>
    """
  end

  # Size
  defp table_size("xs"), do: "table-xs"
  defp table_size("sm"), do: "table-sm"
  defp table_size("md"), do: "table-md"
  defp table_size("lg"), do: "table-lg"
  defp table_size(_size), do: nil
end
