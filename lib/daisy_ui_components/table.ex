defmodule DaisyUIComponents.Table do
  @moduledoc """
  Table component

  https://daisyui.com/components/table/
  """

  use DaisyUIComponents, :component

  import DaisyUIComponents.Button
  import DaisyUIComponents.Icon

  @doc ~S"""
  Renders a table with generic styling.

  ## Examples

      <.table id="users" rows={@users}>
        <:col :let={user} label="id">{user.id}</:col>
        <:col :let={user} label="username">{user.username}</:col>
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
          <.td>{user.id}</.td>
          <.td>{user.username}</.td>
        </.tr>
      </.tbody>
    </.table>
  """
  attr :id, :string, default: nil
  attr :class, :any, default: nil

  attr :container_element, :boolean,
    default: true,
    doc: "whether to wrap the table in a div with overflow-x-auto class"

  attr :sorted_columns, :list,
    default: [],
    doc: """
    list of columns sorted by, each column is a tuple with the column key and direction, e.g. [{:id, :asc}, {:name, :desc}]
    """

  attr :rows, :list
  attr :row_id, :any, default: nil, doc: "the function for generating the row id"
  attr :row_click, :any, default: nil, doc: "the function for handling phx-click on each row"

  attr :row_item, :any,
    default: &Function.identity/1,
    doc: "the function for mapping each row before calling the :col and :action slots"

  slot :col do
    attr :class, :any
    attr :sort_key, :any, doc: "the key for sorting the column when phx-click is triggered"
    attr :collapse_breakpoint, :string, doc: "the breakpoint for collapsing the column"
    attr :label, :string
  end

  attr :target, :string,
    default: nil,
    doc: "the target for phx-click on header columns for sorting"

  attr :event, :string,
    default: "sort",
    doc: "the event name for phx-click on header columns for sorting"

  slot :action, doc: "the slot for showing user actions in the last table column"

  attr :zebra, :boolean, default: false
  attr :size, :string, values: sizes()
  attr :rest, :global
  slot :inner_block

  def table(%{rows: _rows} = assigns) do
    assigns =
      assign(
        assigns,
        :class,
        classes([
          "table",
          maybe_add_class(assigns[:zebra], "table-zebra"),
          table_size(assigns[:size]),
          assigns.class
        ])
      )

    assigns =
      with %{rows: %Phoenix.LiveView.LiveStream{}} <- assigns do
        assign(assigns, row_id: assigns.row_id || fn {id, _item} -> id end)
      end

    ~H"""
    <%= if @container_element do %>
      <div class="overflow-x-auto">
        <.table_rows {assigns} />
      </div>
    <% else %>
      <.table_rows {assigns} />
    <% end %>
    """
  end

  def table(assigns) do
    assigns =
      assign(
        assigns,
        :class,
        classes([
          "table",
          maybe_add_class(assigns[:zebra], "table-zebra"),
          table_size(assigns[:size]),
          assigns.class
        ])
      )

    ~H"""
    <%= if @container_element do %>
      <div class="overflow-x-auto">
        <table class={@class} {@rest}>
          {render_slot(@inner_block)}
        </table>
      </div>
    <% else %>
      <table class={@class} {@rest}>
        {render_slot(@inner_block)}
      </table>
    <% end %>
    """
  end

  defp table_rows(assigns) do
    ~H"""
    <table class={@class} {@rest}>
      <.thead>
        <.tr>
          <.th :for={col <- @col} collapse_breakpoint={col[:collapse_breakpoint]}>
            <%= if col[:sort_key] do %>
              <.button
                ghost
                size="xs"
                phx-click={
                  JS.push(@event,
                    value: %{
                      sort_key: col[:sort_key],
                      sort_direction: switch_sort_direction(@sorted_columns, col[:sort_key])
                    }
                  )
                }
                phx-target={@target}
              >
                <.icon
                  name={sorted_column_icon(@sorted_columns, col[:sort_key])}
                  class="w-3 h-3 mr-1 hover:cursor-pointer"
                />
              </.button>
              {col[:label]}
            <% else %>
              {col[:label]}
            <% end %>
          </.th>
          <.th :if={@action != []}>
            <span class="sr-only"><span class="sr-only">{translate("Actions")}</span></span>
          </.th>
        </.tr>
      </.thead>
      <.tbody id={@id} phx-update={match?(%Phoenix.LiveView.LiveStream{}, @rows) && "stream"}>
        <.tr :for={row <- @rows} id={@row_id && @row_id.(row)}>
          <.td
            :for={col <- @col}
            phx-click={@row_click && @row_click.(row)}
            class={[@row_click && "hover:cursor-pointer", @col[:class]]}
            collapse_breakpoint={col[:collapse_breakpoint]}
          >
            {render_slot(col, @row_item.(row))}
          </.td>
          <.td :if={@action != []}>
            <span :for={action <- @action}>
              {render_slot(action, @row_item.(row))}
            </span>
          </.td>
        </.tr>
      </.tbody>
    </table>
    """
  end

  attr :class, :any, default: nil
  attr :active, :boolean, default: false
  attr :hover, :boolean, default: false
  attr :rest, :global
  slot :inner_block

  def tr(assigns) do
    assigns =
      assign(
        assigns,
        :class,
        classes([
          maybe_add_class(assigns[:active], "active"),
          maybe_add_class(assigns[:hover], "hover"),
          assigns.class
        ])
      )

    ~H"""
    <tr class={@class} {@rest}>
      {render_slot(@inner_block)}
    </tr>
    """
  end

  attr :class, :any, default: nil
  attr :collapse_breakpoint, :string, values: sizes()
  attr :rest, :global
  slot :inner_block

  def td(assigns) do
    assigns =
      assign(
        assigns,
        :class,
        classes([
          collapse_breakpoint(assigns[:collapse_breakpoint]),
          assigns.class
        ])
      )

    ~H"""
    <td class={@class} {@rest}>
      {render_slot(@inner_block)}
    </td>
    """
  end

  attr :class, :any, default: nil
  attr :collapse_breakpoint, :string, values: sizes()
  attr :rest, :global
  slot :inner_block

  def th(assigns) do
    assigns =
      assign(
        assigns,
        :class,
        classes([
          collapse_breakpoint(assigns[:collapse_breakpoint]),
          assigns.class
        ])
      )

    ~H"""
    <th class={@class} {@rest}>
      {render_slot(@inner_block)}
    </th>
    """
  end

  attr :class, :any, default: nil
  attr :rest, :global
  slot :inner_block

  def thead(assigns) do
    ~H"""
    <thead class={@class} {@rest}>
      {render_slot(@inner_block)}
    </thead>
    """
  end

  attr :class, :any, default: nil
  attr :rest, :global
  slot :inner_block

  def tbody(assigns) do
    ~H"""
    <tbody class={@class} {@rest}>
      {render_slot(@inner_block)}
    </tbody>
    """
  end

  # Size
  defp table_size("xs"), do: "table-xs"
  defp table_size("sm"), do: "table-sm"
  defp table_size("md"), do: "table-md"
  defp table_size("lg"), do: "table-lg"
  defp table_size("xl"), do: "table-xl"
  defp table_size(_size), do: nil

  # Collapse Breakpoint
  defp collapse_breakpoint("xs"), do: "hidden xs:table-cell"
  defp collapse_breakpoint("sm"), do: "hidden sm:table-cell"
  defp collapse_breakpoint("md"), do: "hidden md:table-cell"
  defp collapse_breakpoint("lg"), do: "hidden lg:table-cell"
  defp collapse_breakpoint("xl"), do: "hidden xl:table-cell"
  defp collapse_breakpoint(_breakpoint), do: nil

  defp switch_sort_direction(sorted_columns, sort_key) do
    case Enum.find(sorted_columns, fn {key, _} -> key == sort_key end) do
      {_sort_key, :asc} -> :desc
      {_sort_key, :desc} -> :asc
      _ -> :asc
    end
  end

  defp sorted_column_icon(sorted_columns, sort_key) do
    case Enum.find(sorted_columns, fn {key, _} -> key == sort_key end) do
      {_sort_key, direction} ->
        sort_icon(direction)

      _ ->
        "hero-arrow-up"
    end
  end

  defp sort_icon(:asc), do: "hero-arrow-up"
  defp sort_icon(:desc), do: "hero-arrow-down"
  defp sort_icon(_), do: "hero-arrow-up"
end
