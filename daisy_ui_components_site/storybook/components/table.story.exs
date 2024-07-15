defmodule Storybook.Components.Table do
  use PhoenixStorybook.Story, :component

  alias DaisyUIComponents.Table

  def imports,
    do: [
      {DaisyUIComponents.Table, [thead: 1, tr: 1, th: 1, tbody: 1, td: 1]}
    ]

  def function, do: &Table.table/1

  def template do
    """
    <div class="overflow-x-auto">
      <.psb-variation/>
    </div>
    """
  end

  def variations do
    [
      %Variation{
        id: :table,
        slots: [
          """
          <.thead>
            <.tr>
              <.th>Name</.th>
              <.th>Job</.th>
              <.th>Favourite Color</.th>
            </.tr>
          </.thead>
          <.tbody>
            <!-- row 1 -->
            <.tr>
              <.th>1</.th>
              <.td>Cy Ganderton</.td>
              <.td>Quality Control Specialist</.td>
              <.td>Blue</.td>
            </.tr>
            <!-- row 2 -->
            <.tr>
              <.th>2</.th>
              <.td>Hart Hagerty</.td>
              <.td>Desktop Support Technician</.td>
              <.td>Purple</.td>
            </.tr>
            <!-- row 3 -->
            <.tr>
              <.th>3</.th>
              <.td>Brice Swyre</.td>
              <.td>Tax Accountant</.td>
              <.td>Red</.td>
            </.tr>
          </.tbody>
          """
        ]
      },
      %Variation{
        id: :table_with_column_slots,
        attributes: %{
          rows: get_users()
        },
        slots: [
          """
          <:col :let={user} label="Id">
            <%= user.id %>
          </:col>
          <:col :let={user} label="name">
            <%= user.name %>
          </:col>
          <:col :let={user} label="Job">
            <%= user.job %>
          </:col>
          <:col :let={user} label="Favourite Color">
            <%= user.favourite_color %>
          </:col>
          """
        ]
      },
      %Variation{
        id: :zebra,
        attributes: %{
          zebra: true,
          rows: get_users()
        },
        slots: [
          """
          <:col :let={user} label="Id">
            <%= user.id %>
          </:col>
          <:col :let={user} label="name">
            <%= user.name %>
          </:col>
          <:col :let={user} label="Job">
            <%= user.job %>
          </:col>
          <:col :let={user} label="Favourite Color">
            <%= user.favourite_color %>
          </:col>
          """
        ]
      },
      %Variation{
        id: :table_xs,
        attributes: %{
          size: "xs",
          rows: get_users()
        },
        slots: [
          """
          <:col :let={user} label="Id">
            <%= user.id %>
          </:col>
          <:col :let={user} label="name">
            <%= user.name %>
          </:col>
          <:col :let={user} label="Job">
            <%= user.job %>
          </:col>
          <:col :let={user} label="Favourite Color">
            <%= user.favourite_color %>
          </:col>
          """
        ]
      }
    ]
  end

  defp get_users() do
    [
      %{id: 1, name: "Cy Ganderton", job: "Quality Control Specialist", favourite_color: "Blue"},
      %{
        id: 2,
        name: "Hart Hagerty",
        job: "Desktop Support Technician",
        favourite_color: "Purple"
      },
      %{id: 3, name: "Brice Swyre", job: "Tax Accountant", favourite_color: "Red"}
    ]
  end
end
