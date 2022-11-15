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
             ~s(<div class="alert shadow-lg">)

    assert rendered_to_string(~H"""
           <.alert icon={false} color="info" label="alert" />
           """) =~
             ~s(<div class="alert alert-info shadow-lg">)

    assert rendered_to_string(~H"""
           <.alert icon={false} color="success" label="alert" />
           """) =~
             ~s(<div class="alert alert-success shadow-lg">)

    assert rendered_to_string(~H"""
           <.alert icon={false} color="warning" label="alert" />
           """) =~
             ~s(<div class="alert alert-warning shadow-lg">)

    assert rendered_to_string(~H"""
           <.alert icon={false} color="error" label="alert" />
           """) =~
             ~s(<div class="alert alert-error shadow-lg">)
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
           """) =~ "M13 16h-1v-4h-1m1-4h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z"

    assert rendered_to_string(~H"""
           <.alert color="info" label="alert" />
           """) =~ "M13 16h-1v-4h-1m1-4h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z"

    assert rendered_to_string(~H"""
           <.alert color="success" label="alert" />
           """) =~ "M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z"

    assert rendered_to_string(~H"""
           <.alert color="warning" label="alert" />
           """) =~
             "M12 9v2m0 4h.01m-6.938 4h13.856c1.54 0 2.502-1.667 1.732-3L13.732 4c-.77-1.333-2.694-1.333-3.464 0L3.34 16c-.77 1.333.192 3 1.732 3z"

    assert rendered_to_string(~H"""
           <.alert color="error" label="alert" />
           """) =~ "M10 14l2-2m0 0l2-2m-2 2l-2-2m2 2l2 2m7-2a9 9 0 11-18 0 9 9 0 0118 0z"
  end
end
