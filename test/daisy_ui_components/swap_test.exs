defmodule DaisyUIComponents.SwapTest do
  use ExUnit.Case

  import Phoenix.Component
  import Phoenix.LiveViewTest
  import DaisyUIComponents.Swap

  test "swap" do
    assigns = %{}

    swap =
      rendered_to_string(~H"""
      <.swap />
      """)

    assert swap =~ ~s(<label)
    assert swap =~ ~s(class="swap")
    assert swap =~ ~s(<input type="checkbox">)
  end

  test "swap animations" do
    for animation <- ["flip", "rotate"] do
      assigns = %{animation: animation}

      assert rendered_to_string(~H"""
             <.swap animation={@animation} />
             """) =~ ~s(<label class="swap swap-#{animation}">)
    end
  end

  test "swap label slots" do
    assigns = %{}

    swap =
      rendered_to_string(~H"""
      <.swap animation="flip">
        <:swap_on name="ON" />
        <:swap_off name="OFF" />
      </.swap>
      """)

    assert swap =~ ~s(<label class="swap swap-flip")
    assert swap =~ ~s(<div class="swap-on">ON)
    assert swap =~ ~s(<div class="swap-off">OFF)
  end

  test "swap icon slots" do
    assigns = %{}

    swap =
      rendered_to_string(~H"""
      <.swap animation="flip">
        <:swap_on type="icon" name="hero-plus" />
        <:swap_off type="icon" name="hero-minus" />
      </.swap>
      """)

    assert swap =~ ~s(<label class="swap swap-flip")
    assert swap =~ ~s(<span class="hero-plus swap-on">)
    assert swap =~ ~s(<span class="hero-minus swap-off">)
  end
end
