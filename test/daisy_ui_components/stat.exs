defmodule DaisyUIComponents.StatTest do
  use ExUnit.Case

  import Phoenix.Component
  import Phoenix.LiveViewTest
  import DaisyUIComponents.Stat

  alias DaisyUIComponents.Utils

  test "stats" do
    assigns = %{}

    stats =
      rendered_to_string(~H"""
      <.stats>
        <.stat>
          <.stat_title>Total Page Views</.stat_title>
          <.stat_value>89,400</.stat_value>
          <.stat_desc>21% more than last month</.stat_desc>
        </.stat>
      </.stats>
      """)

    assert stats =~ ~s(<div class="stats">)
    assert stats =~ ~s(<div class="stat">)
    assert stats =~ ~s(<div class="stat-title">)
    assert stats =~ ~s(Total Page Views)
    assert stats =~ ~s(<div class="stat-value">)
    assert stats =~ ~s(89,400)
    assert stats =~ ~s(<div class="stat-desc">)
    assert stats =~ ~s(21% more than last month)
  end

  test "stats direction" do
    for direction <- Utils.directions() do
      assigns = %{direction: direction}

      assert rendered_to_string(~H"""
             <.stats direction={@direction} />
             """) =~ ~s(<div class="stats stats-#{direction}">)
    end
  end

  test "stat" do
    assigns = %{}

    stat =
      rendered_to_string(~H"""
      <.stat>
        inner content
      </.stat>
      """)

    assert stat =~ ~s(<div class="stat">)
    assert stat =~ ~s(inner content)
  end

  test "stat title" do
    assigns = %{}

    stat_title =
      rendered_to_string(~H"""
      <.stat_title>Account balance</.stat_title>
      """)

    assert stat_title =~ ~s(<div class="stat-title">)
    assert stat_title =~ ~s(Account balance)
  end

  test "stat value" do
    assigns = %{}

    stat_value =
      rendered_to_string(~H"""
      <.stat_value>$89,40</.stat_value>
      """)

    assert stat_value =~ ~s(<div class="stat-value">)
    assert stat_value =~ ~s($89,40)
  end

  test "stat desc" do
    assigns = %{}

    stat_desc =
      rendered_to_string(~H"""
      <.stat_desc>From January 1st to February 1st</.stat_desc>
      """)

    assert stat_desc =~ ~s(<div class="stat-desc">)
    assert stat_desc =~ ~s(From January 1st to February 1st)
  end

  test "stat figure" do
    assigns = %{}

    stat_figure =
      rendered_to_string(~H"""
      <.stat_figure>Some icon</.stat_figure>
      """)

    assert stat_figure =~ ~s(<div class="stat-figure">)
    assert stat_figure =~ ~s(Some icon)
  end

  test "stat actions" do
    assigns = %{}

    stat_actions =
      rendered_to_string(~H"""
      <.stat_actions>buttons here</.stat_actions>
      """)

    assert stat_actions =~ ~s(<div class="stat-actions">)
    assert stat_actions =~ ~s(buttons here)
  end
end
