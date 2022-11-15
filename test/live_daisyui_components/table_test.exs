defmodule LiveDaisyuiComponents.TableTest do
  use ExUnit.Case

  import Phoenix.Component
  import Phoenix.LiveViewTest
  import LiveDaisyuiComponents.Table

  test "table" do
    assigns = %{}

    table =
      rendered_to_string(~H"""
      <.table class="test-table" />
      """)

    assert table =~ ~s(<table class="table w-full test-table">)

    table =
      rendered_to_string(~H"""
      <.table zebra class="test-table" />
      """)

    assert table =~ ~s(<table class="table w-full table-zebra test-table">)
  end

  test "tr" do
    assigns = %{}

    tr =
      rendered_to_string(~H"""
      <.tr active class="test-tr" />
      """)

    assert tr =~ ~s(<tr class="active test-tr">)

    tr =
      rendered_to_string(~H"""
      <.tr active hover class="test-tr" />
      """)

    assert tr =~ ~s(<tr class="active hover test-tr">)
  end

  test "td th thead tbody" do
    assigns = %{}

    td =
      rendered_to_string(~H"""
      <.td class="test-td" />
      """)

    assert td =~ ~s(<td class="test-td">)

    th =
      rendered_to_string(~H"""
      <.th class="test-th" />
      """)

    assert th =~ ~s(<th class="test-th">)

    thead =
      rendered_to_string(~H"""
      <.thead class="test-thead" />
      """)

    assert thead =~ ~s(<thead class="test-thead">)

    tbody =
      rendered_to_string(~H"""
      <.tbody class="test-tbody" />
      """)

    assert tbody =~ ~s(<tbody class="test-tbody">)
  end
end
