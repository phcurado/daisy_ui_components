defmodule DaisyUIComponents.AlertTest do
  use DaisyUIComponents.ComponentCase

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

  test "alert boolean assigns" do
    for boolean_assign <- ~w(soft dash outline)a do
      assigns = %{boolean_assign => true}

      ~H"""
      <.alert {assigns}>My Alert</.alert>
      """
      |> parse_component()
      |> assert_component("div")
      |> assert_class("alert alert-#{boolean_assign}")
      |> assert_text("My Alert")
    end
  end

  test "alert directions" do
    for direction <- ~w(vertical horizontal) do
      assigns = %{direction: direction}

      assert rendered_to_string(~H"""
             <.alert direction={@direction}>My Alert</.alert>
             """) =~ ~s(<div class="alert alert-#{direction}">)
    end
  end
end
