defmodule LiveDaisyuiComponents.Table do
  @moduledoc """
  Table component

  https://daisyui.com/components/table/


  """

  use LiveDaisyuiComponents.Component

  attr :zebra, :boolean, default: false
  attr :size, :string, values: sizes()
  attr :rest, :global
  slot :inner_block

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
