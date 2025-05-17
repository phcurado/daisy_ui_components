defmodule DaisyUIComponents.StepsTest do
  use DaisyUIComponents.ComponentCase

  import Phoenix.Component
  import DaisyUIComponents.Steps

  describe "steps component" do
    test "expected classes added" do
      for step_color <- step_colors() do
        assigns = %{color: step_color}

        ~H"""
        <.steps>
          <.step color={@color}>My Step</.step>
        </.steps>
        """
        |> parse_component()
        |> assert_component("ul")
        |> assert_class("steps")
        |> assert_children("li", fn step ->
          step
          |> assert_class("step step-#{step_color}")
          |> assert_text("My Step")
        end)
      end
    end

    test "vertical steps" do
      assigns = %{}

      ~H"""
      <.steps vertical>
        <.step color="primary">Register</.step>
      </.steps>
      """
      |> parse_component()
      |> assert_component("ul")
      |> assert_class("steps steps-vertical")
      |> assert_children("li", fn step ->
        step
        |> assert_class("step step-primary")
        |> assert_text("Register")
      end)
    end

    test "horizontal steps" do
      assigns = %{}

      ~H"""
      <.steps horizontal>
        <.step color="primary">Register</.step>
      </.steps>
      """
      |> parse_component()
      |> assert_component("ul")
      |> assert_class("steps steps-horizontal")
      |> assert_children("li", fn step ->
        step
        |> assert_class("step step-primary")
        |> assert_text("Register")
      end)
    end

    test "steps with icons" do
      assigns = %{}

      ~H"""
      <.steps>
        <.step icon="😕">
          Step 1
        </.step>
      </.steps>
      """
      |> parse_component()
      |> assert_component("ul")
      |> assert_class("steps")
      |> assert_children("li", fn step ->
        step
        |> assert_class("step")
        |> assert_children("span", fn icon ->
          icon
          |> assert_class("step-icon")
          |> assert_text("😕")
        end)
      end)
    end

    test "steps with content" do
      assigns = %{}

      ~H"""
      <.steps>
        <.step content="★">Step 1</.step>
      </.steps>
      """
      |> parse_component()
      |> assert_component("ul")
      |> assert_class("steps")
      |> assert_children("li", fn step ->
        step
        |> assert_class("step")
        |> assert_attribute("data-content", "★")
        |> assert_text("Step 1")
      end)
    end

    test "steps with colors and error state" do
      assigns = %{}

      ~H"""
      <.steps>
        <.step color="error" content="?">Sit</.step>
      </.steps>
      """
      |> parse_component()
      |> assert_component("ul")
      |> assert_class("steps")
      |> assert_children("li", fn step ->
        step
        |> assert_class("step step-error")
        |> assert_attribute("data-content", "?")
        |> assert_text("Sit")
      end)
    end
  end
end
