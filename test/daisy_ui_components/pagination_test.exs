defmodule DaisyUIComponents.PaginationTest do
  use DaisyUIComponents.ComponentCase
  import Phoenix.Component

  import DaisyUIComponents.Pagination

  test "pagination" do
    assigns = %{}

    ~H[<.pagination page={1} page_size={10} total_entries={20} page_click_event="page_click" />]
    |> parse_component()
    |> assert_component("div")
    |> assert_class("join")
    |> select_children(fn [button1, button2] = buttons ->
      for {button, page} <- Enum.with_index(buttons, 1) do
        button
        |> assert_component("button")
        |> assert_attribute("phx-click", "page_click")
        |> assert_attribute("phx-value-page", to_string(page))
        |> assert_text(to_string(page))
      end

      assert_class(button1, "btn btn-active join-item")
      assert_class(button2, "btn join-item")
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
