defmodule DaisyUIComponents.HeroTest do
  use ExUnit.Case

  import Phoenix.Component
  import Phoenix.LiveViewTest
  import DaisyUIComponents.Hero

  test "hero" do
    assigns = %{}

    hero =
      rendered_to_string(~H"""
      <.hero>
        hero inner slot
      </.hero>
      """)

    assert hero =~ ~s(<div class="hero">)
    assert hero =~ ~s(hero inner slot)
  end

  test "hero with named slots" do
    assigns = %{}

    hero =
      rendered_to_string(~H"""
      <.hero class="text-xl">
        <:overlay class="overlay"></:overlay>
        <:content class="text-center">
          hero content slot
        </:content>
        hero inner slot
      </.hero>
      """)

    assert hero =~ ~s(<div class="hero text-xl">)
    assert hero =~ ~s(<div class="hero-overlay overlay">)
    assert hero =~ ~s(<div class="hero-content text-center">)
    assert hero =~ ~s(hero content slot)
    assert hero =~ ~s(hero inner slot)
  end
end
