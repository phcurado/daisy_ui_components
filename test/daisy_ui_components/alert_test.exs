defmodule DaisyUIComponents.AlertTest do
  use ExUnit.Case
  import Phoenix.Component
  import Phoenix.LiveViewTest

  import DaisyUIComponents.Alert

  test "alert" do
    assigns = %{}

    assert alert =
             rendered_to_string(~H"""
             <.alert label="alert">Alerting</.alert>
             """)

    alert =~ ~s(<div class="alert">)
    alert =~ "alerting"
  end

  test "alert colors" do
    for color <- ~w(info success warning error) do
      assigns = %{color: color}

      assert rendered_to_string(~H"""
             <.alert color={@color}>My alert</.alert>
             """) =~ ~s(<div class="alert alert-#{color}">)
    end
  end
end
