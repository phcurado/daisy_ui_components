defmodule LiveDaisyuiComponents.Table do
  @moduledoc """
  Table component

  https://daisyui.com/components/table/


  """

  use LiveDaisyuiComponents.Component

  attr :zebra, :boolean, default: false
  attr :padding, :string, values: ~w(normal compact)
  attr :rest, :global
  slot :inner_block

  def table(assigns) do
    assigns =
      join_classes_with_rest(assigns, [
        "table w-full",
        add_class_from_bool(assigns[:zebra], "table-zebra"),
        add_class_from_padding(assigns[:padding])
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

  defp add_class_from_padding("normal"), do: "table-normal"
  defp add_class_from_padding("compact"), do: "table-compact"
  defp add_class_from_padding(nil), do: nil
end
