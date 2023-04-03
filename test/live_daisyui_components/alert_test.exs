defmodule LiveDaisyuiComponents.AlertTest do
  use ExUnit.Case
  import Phoenix.Component
  import Phoenix.LiveViewTest

  import LiveDaisyuiComponents.Alert

  test "alert" do
    assigns = %{}

    assert rendered_to_string(~H"""
           <.alert icon={false} label="alert" />
           """) =~
             ~s(<div class="alert shadow-lg items-start">)

    assert rendered_to_string(~H"""
           <.alert icon={false} color="info" label="alert" />
           """) =~
             ~s(<div class="alert alert-info shadow-lg items-start">)

    assert rendered_to_string(~H"""
           <.alert icon={false} color="success" label="alert" />
           """) =~
             ~s(<div class="alert alert-success shadow-lg items-start">)

    assert rendered_to_string(~H"""
           <.alert icon={false} color="warning" label="alert" />
           """) =~
             ~s(<div class="alert alert-warning shadow-lg items-start">)

    assert rendered_to_string(~H"""
           <.alert icon={false} color="error" label="alert" />
           """) =~
             ~s(<div class="alert alert-error shadow-lg items-start">)
  end

  test "alert label or slot" do
    assigns = %{}

    assert rendered_to_string(~H"""
           <.alert label="test label" />
           """) =~
             ~s(test label)

    assert rendered_to_string(~H"""
           <.alert icon={false}>slot label</.alert>
           """) =~
             ~s(slot label)
  end

  test "alert icon" do
    assigns = %{}

    assert rendered_to_string(~H"""
           <.alert label="alert" />
           """) =~ ~s(<span class="hero-exclamation-circle">)

    assert rendered_to_string(~H"""
           <.alert color="info" label="alert" />
           """) =~ ~s(<span class="hero-exclamation-circle">)

    assert rendered_to_string(~H"""
           <.alert color="success" label="alert" />
           """) =~ ~s(<span class="hero-check-circle">)

    assert rendered_to_string(~H"""
           <.alert color="warning" label="alert" />
           """) =~ ~s(<span class="hero-exclamation-triangle">)

    assert rendered_to_string(~H"""
           <.alert color="error" label="alert" />
           """) =~ ~s(<span class="hero-x-circle">)
  end
end
