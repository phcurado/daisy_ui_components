defmodule DaisyUIComponents.IndicatorTest do
  use ExUnit.Case

  import Phoenix.Component
  import Phoenix.LiveViewTest
  import DaisyUIComponents.Indicator

  test "indicator" do
    assigns = %{}

    indicator =
      rendered_to_string(~H"""
      <.indicator>
        <span class="indicator-item status status-success"></span>
      </.indicator>
      """)

    assert indicator =~ ~s(<div class="indicator">)
    assert indicator =~ ~s(<span class="indicator-item status status-success"></span>)
  end

  test "Indicator direction" do
    for align <- indicator_aligns(),
        direction <- indicator_directions() do
      assigns = %{direction: direction, align: align}

      assert rendered_to_string(~H"""
             <.indicator direction={@direction} align={@align}>
               <span class="indicator-item status status-success"></span>
             </.indicator>
             """) =~ ~s(<div class="indicator indicator-#{direction} indicator-#{align}">)
    end
  end
end
