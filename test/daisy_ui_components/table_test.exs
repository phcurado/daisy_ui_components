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
    <.td class="test-td" />
    """
    |> parse_component()
    |> assert_component("td")
    |> assert_class("test-td")

    ~H"""
    <.th class="test-th" />
    """
    |> parse_component()
    |> assert_component("th")
    |> assert_class("test-th")

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

  test "forwards native table attributes via :rest" do
    assigns = %{}

    ~H"""
    <.table
      align="center"
      border="1"
      cellpadding="2"
      cellspacing="3"
      frame="box"
      rules="all"
      summary="Example summary"
      width="100%"
      container_element={false}
    >
      <.thead align="left" char="-" charoff="1" valign="middle">
        <.tr align="right" bgcolor="#eee" char="." charoff="2" valign="top">
          <.th
            abbr="id"
            colspan="2"
            headers="hdr"
            height="10"
            rowspan="1"
            scope="col"
            valign="bottom"
            width="50"
          >
            ID
          </.th>
        </.tr>
      </.thead>
      <.tbody align="left" char="-" charoff="3" valign="middle">
        <.tr align="left" bgcolor="#fafafa" char="/" charoff="4" valign="bottom">
          <.td colspan="2" headers="hdr" height="20" rowspan="1" valign="middle" width="60">
            123
          </.td>
        </.tr>
      </.tbody>
    </.table>
    """
    |> parse_component()
    |> assert_component("table")
    |> assert_attribute("align", "center")
    |> assert_attribute("border", "1")
    |> assert_attribute("cellpadding", "2")
    |> assert_attribute("cellspacing", "3")
    |> assert_attribute("frame", "box")
    |> assert_attribute("rules", "all")
    |> assert_attribute("summary", "Example summary")
    |> assert_attribute("width", "100%")
    |> assert_children("thead", fn thead ->
      thead
      |> assert_attribute("align", "left")
      |> assert_attribute("char", "-")
      |> assert_attribute("charoff", "1")
      |> assert_attribute("valign", "middle")
      |> assert_children("tr", fn tr ->
        tr
        |> assert_attribute("align", "right")
        |> assert_attribute("bgcolor", "#eee")
        |> assert_attribute("char", ".")
        |> assert_attribute("charoff", "2")
        |> assert_attribute("valign", "top")
        |> assert_children("th", fn th ->
          th
          |> assert_attribute("abbr", "id")
          |> assert_attribute("colspan", "2")
          |> assert_attribute("headers", "hdr")
          |> assert_attribute("height", "10")
          |> assert_attribute("rowspan", "1")
          |> assert_attribute("scope", "col")
          |> assert_attribute("valign", "bottom")
          |> assert_attribute("width", "50")
          |> assert_text("ID")
        end)
      end)
    end)
    |> assert_children("tbody", fn tbody ->
      tbody
      |> assert_attribute("align", "left")
      |> assert_attribute("char", "-")
      |> assert_attribute("charoff", "3")
      |> assert_attribute("valign", "middle")
      |> assert_children("tr", fn tr ->
        tr
        |> assert_attribute("align", "left")
        |> assert_attribute("bgcolor", "#fafafa")
        |> assert_attribute("char", "/")
        |> assert_attribute("charoff", "4")
        |> assert_attribute("valign", "bottom")
        |> assert_children("td", fn td ->
          td
          |> assert_attribute("colspan", "2")
          |> assert_attribute("headers", "hdr")
          |> assert_attribute("height", "20")
          |> assert_attribute("rowspan", "1")
          |> assert_attribute("valign", "middle")
          |> assert_attribute("width", "60")
          |> assert_text("123")
        end)
      end)
    end)
  end
end
