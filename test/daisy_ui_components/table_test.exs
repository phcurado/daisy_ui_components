defmodule DaisyUIComponents.TableTest do
  use DaisyUIComponents.ComponentCase

  import Phoenix.Component
  import DaisyUIComponents.Table

  test "table" do
    assigns = %{}

    ~H"""
    <.table class="test-table" container_element={false} />
    """
    |> parse_component()
    |> assert_component("table")
    |> assert_class("table test-table")
  end

  test "table with zebra stripes" do
    assigns = %{}

    ~H"""
    <.table zebra class="test-table" container_element={false} />
    """
    |> parse_component()
    |> assert_component("table")
    |> assert_class("table table-zebra test-table")
  end

  test "table wrapped in a div" do
    assigns = %{}

    ~H"""
    <.table class="test-table" container_element={true} />
    """
    |> parse_component()
    |> assert_component("div")
    |> assert_class("overflow-x-auto")
    |> assert_children("table", fn table ->
      table
      |> assert_component("table")
      |> assert_class("table test-table")
    end)
  end

  test "table with declared columns" do
    assigns = %{}

    ~H"""
    <.table
      id="user"
      rows={[%{id: 12345, username: "John"}, %{id: 12346, username: "Doe"}]}
      container_element={false}
    >
      <:col :let={user} label="id" class="col-id">{user.id}</:col>
      <:col :let={user} label="username">{user.username}</:col>
    </.table>
    """
    |> parse_component()
    |> assert_component("table")
    |> assert_class("table")
    |> assert_children("tbody#user", fn tbody ->
      tbody
      |> assert_component("tbody")
      |> select_children(fn [tr_1, tr_2] ->
        tr_1
        |> assert_component("tr")
        |> select_children(fn [td_1, td_2] ->
          td_1
          |> assert_component("td")
          |> assert_class("col-id")
          |> assert_text("12345")

          td_2
          |> assert_component("td")
          |> assert_text("John")
        end)

        tr_2
        |> assert_component("tr")
        |> select_children(fn [td_1, td_2] ->
          td_1
          |> assert_component("td")
          |> assert_class("col-id")
          |> assert_text("12346")

          td_2
          |> assert_component("td")
          |> assert_text("Doe")
        end)
      end)
    end)
  end

  test "tr with active and hover classes" do
    assigns = %{}

    ~H"""
    <.tr active class="test-tr" />
    """
    |> parse_component()
    |> assert_component("tr")
    |> assert_class("active test-tr")

    ~H"""
    <.tr active hover class="test-tr" />
    """
    |> parse_component()
    |> assert_component("tr")
    |> assert_class("active hover test-tr")
  end

  test "td th thead and tbody" do
    assigns = %{}

    ~H"""
    <.td class="test-td" colspan="2" headers="hdr" rowspan="1" />
    """
    |> parse_component()
    |> assert_component("td")
    |> assert_class("test-td")
    |> assert_attribute("colspan", "2")
    |> assert_attribute("headers", "hdr")
    |> assert_attribute("rowspan", "1")

    ~H"""
    <.th class="test-th" abbr="id" colspan="2" headers="hdr" rowspan="1" scope="col" />
    """
    |> parse_component()
    |> assert_component("th")
    |> assert_class("test-th")
    |> assert_attribute("abbr", "id")
    |> assert_attribute("colspan", "2")
    |> assert_attribute("headers", "hdr")
    |> assert_attribute("rowspan", "1")
    |> assert_attribute("scope", "col")

    ~H"""
    <.thead class="test-thead" />
    """
    |> parse_component()
    |> assert_component("thead")
    |> assert_class("test-thead")

    ~H"""
    <.tbody class="test-tbody" />
    """
    |> parse_component()
    |> assert_component("tbody")
    |> assert_class("test-tbody")
  end
end
