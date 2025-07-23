defmodule DaisyUIComponents.PaginationTest do
  use DaisyUIComponents.ComponentCase

  import DaisyUIComponents.Pagination

  test "pagination" do
    assigns = %{}

    ~H"""
    <.pagination page={1} page_size={10} total_entries={100} />
    """
    |> parse_component()
    |> assert_component("div")
    |> assert_class("join")
    |> select_children(fn btns ->
      {[btn_active], btns} = Enum.split(btns, 1)
      {btns_left, btns} = Enum.split(btns, 4)
      {[btn_dots], [btn_right]} = Enum.split(btns, 1)

      btn_active
      |> assert_component("button")
      |> assert_class("btn btn-active join-item")
      |> assert_text("1")

      btns_left
      |> Enum.with_index()
      |> Enum.each(fn {btn, index} ->
        page = index + 2

        btn
        |> assert_component("button")
        |> assert_class("btn join-item")
        |> assert_text(to_string(page))
      end)

      btn_dots
      |> assert_component("button")
      |> assert_class("btn btn-disabled join-item")
      |> assert_text("...")

      btn_right
      |> assert_component("button")
      |> assert_class("btn join-item")
      |> assert_text("10")
    end)
  end

  test "page_click_event and on_page_click" do
    assigns = %{}

    ~H"""
    <.pagination page={1} page_size={10} total_entries={100} on_page_click="hello" />
    """
    |> parse_component()
    |> assert_component("div")
    |> assert_class("join")
    |> select_children(fn btns ->
      [first_btn] = Enum.take(btns, 1)

      first_btn
      |> assert_component("button")
      |> assert_attribute("phx-click", "hello")
    end)
  end

  test "calculate_display_btn" do
    assert [1, 2] == calculate_display_btn(1, 10, 20)
    assert [1, 2, 3, 4] == calculate_display_btn(1, 10, 40)
    assert [1, 2, 3, 4, 5, 6] == calculate_display_btn(1, 10, 60)

    assert [1, 2, 3, 4, 5, 6, 7] == calculate_display_btn(1, 10, 70)
    assert [1, 2, 3, 4, 5, 6, 7] == calculate_display_btn(4, 10, 70)

    assert [1, 2, 3, 4, 5, "...", 8] == calculate_display_btn(1, 10, 80)
    assert [1, 2, 3, 4, 5, "...", 8] == calculate_display_btn(2, 10, 80)
    assert [1, 2, 3, 4, 5, "...", 8] == calculate_display_btn(4, 10, 80)
    assert [1, "...", 4, 5, 6, 7, 8] == calculate_display_btn(5, 10, 80)

    assert [1, 2, 3, 4, 5, "...", 10] == calculate_display_btn(4, 10, 100)
    assert [1, "...", 4, 5, 6, "...", 10] == calculate_display_btn(5, 10, 100)
    assert [1, "...", 6, 7, 8, 9, 10] == calculate_display_btn(7, 10, 100)
    assert [1, "...", 6, 7, 8, 9, 10] == calculate_display_btn(9, 10, 100)
  end
end
