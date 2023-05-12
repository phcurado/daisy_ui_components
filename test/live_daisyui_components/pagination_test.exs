defmodule LiveDaisyuiComponents.PaginationTest do
  use ExUnit.Case
  import Phoenix.Component
  import Phoenix.LiveViewTest

  import LiveDaisyuiComponents.Pagination

  test "pagination" do
    assigns = %{page: 1, page_size: 10, total_entries: 100}

    pagination =
      rendered_to_string(~H"""
      <.pagination />
      """)

    assert pagination =~ ~s(<div class="btn-group">)
    assert pagination =~ ~s(<button class="btn")
    assert pagination =~ ~s(<button class="btn btn-active")
    assert pagination =~ ~s(<button class="btn btn-disabled")
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
  end
end
