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
        <:badge color="primary"></:badge>
      </.indicator>
      """)

    assert indicator =~ ~s(<div class="indicator">)
    assert indicator =~ ~s(<span class="badge badge-primary indicator-item">)
  end

  test "indicator without badge slot" do
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
             <.indicator>
               <:badge color="secondary" align={@align} direction={@direction}></:badge>
             </.indicator>
             """) =~
               ~s(<span class="badge badge-secondary indicator-item indicator-#{align} indicator-#{direction}">)
    end
  end
end
