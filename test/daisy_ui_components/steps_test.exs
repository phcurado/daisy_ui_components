defmodule DaisyUIComponents.StepsTest do
  use DaisyUIComponents.ComponentCase

  import Phoenix.Component
  import Phoenix.LiveViewTest
  import DaisyUIComponents.Steps

  describe "steps component" do
    test "basic steps" do
      assigns = %{}

      component =
        ~H"""
        <.steps>
          <.step primary>Register</.step>
          <.step primary>Choose plan</.step>
          <.step>Purchase</.step>
          <.step>Receive Product</.step>
        </.steps>
        """

      expected_component =
        ~H"""
        <ul class="steps">
          <li class="step step-primary">Register</li>
          <li class="step step-primary">Choose plan</li>
          <li class="step">Purchase</li>
          <li class="step">Receive Product</li>
        </ul>
        """

      assert_components(component, expected_component)
    end

    test "vertical steps" do
      assigns = %{}

      component =
        ~H"""
        <.steps vertical>
          <.step primary>Register</.step>
          <.step primary>Choose plan</.step>
          <.step>Purchase</.step>
          <.step>Receive Product</.step>
        </.steps>
        """

      expected_component =
        ~H"""
        <ul class="steps steps-vertical">
          <li class="step step-primary">Register</li>
          <li class="step step-primary">Choose plan</li>
          <li class="step">Purchase</li>
          <li class="step">Receive Product</li>
        </ul>
        """

      assert_components(component, expected_component)
    end

    test "horizontal steps" do
      assigns = %{}

      component =
        ~H"""
        <.steps horizontal>
          <.step primary>Register</.step>
          <.step primary>Choose plan</.step>
          <.step>Purchase</.step>
          <.step>Receive Product</.step>
        </.steps>
        """

      expected_component =
        ~H"""
        <ul class="steps steps-horizontal">
          <li class="step step-primary">Register</li>
          <li class="step step-primary">Choose plan</li>
          <li class="step">Purchase</li>
          <li class="step">Receive Product</li>
        </ul>
        """

      assert_components(component, expected_component)
    end

    test "steps with icons" do
      assigns = %{}

      component =
        ~H"""
        <.steps>
          <.step neutral>
            <span class="step-icon">😕</span>Step 1
          </.step>
          <.step neutral>
            <span class="step-icon">😃</span>Step 2
          </.step>
          <.step>
            <span class="step-icon">😍</span>Step 3
          </.step>
        </.steps>
        """

      expected_component =
        ~H"""
        <ul class="steps">
          <li class="step step-neutral">
            <span class="step-icon">😕</span>Step 1
          </li>
          <li class="step step-neutral">
            <span class="step-icon">😃</span>Step 2
          </li>
          <li class="step">
            <span class="step-icon">😍</span>Step 3
          </li>
        </ul>
        """

      assert_components(component, expected_component)
    end

    test "steps with content" do
      assigns = %{}

      component =
        ~H"""
        <.steps>
          <.step content="?" neutral>Step 1</.step>
          <.step content="!" neutral>Step 2</.step>
          <.step content="✓" neutral>Step 3</.step>
          <.step content="✕" neutral="true">Step 4</.step>
          <.step content="★" neutral="true">Step 5</.step>
          <.step content="" neutral="true">Step 6</.step>
          <.step content="●" neutral="true">Step 7</.step>
        </.steps>
        """

      expected_component =
        ~H"""
        <ul class="steps">
          <li data-content="?" class="step step-neutral">Step 1</li>
          <li data-content="!" class="step step-neutral">Step 2</li>
          <li data-content="✓" class="step step-neutral">Step 3</li>
          <li data-content="✕" class="step step-neutral">Step 4</li>
          <li data-content="★" class="step step-neutral">Step 5</li>
          <li data-content="" class="step step-neutral">Step 6</li>
          <li data-content="●" class="step step-neutral">Step 7</li>
        </ul>
        """

      assert_components(component, expected_component)
    end

    test "steps with colors and error state" do
      assigns = %{}

      component =
        ~H"""
        <.steps>
          <.step info>Fly to moon</.step>
          <.step info>Shrink the moon</.step>
          <.step info>Grab the moon</.step>
          <.step error content="?">Sit</.step>
        </.steps>
        """

      expected_component =
        ~H"""
        <ul class="steps">
          <li class="step step-info">Fly to moon</li>
          <li class="step step-info">Shrink the moon</li>
          <li class="step step-info">Grab the moon</li>
          <li data-content="?" class="step step-error">Sit</li>
        </ul>
        """

      assert_components(component, expected_component)
    end

    test "steps with multiple styles" do
      assigns = %{}

      component =
        ~H"""
        <.steps>
          <.step neutral>Step 1</.step>
          <.step primary>Step 2</.step>
          <.step secondary>Step 3</.step>
          <.step accent>Step 4</.step>
          <.step success>Step 5</.step>
          <.step warning>Step 6</.step>
          <.step error>Step 7</.step>
        </.steps>
        """

      expected_component =
        ~H"""
        <ul class="steps">
          <li class="step step-neutral">Step 1</li>
          <li class="step step-primary">Step 2</li>
          <li class="step step-secondary">Step 3</li>
          <li class="step step-accent">Step 4</li>
          <li class="step step-success">Step 5</li>
          <li class="step step-warning">Step 6</li>
          <li class="step step-error">Step 7</li>
        </ul>
        """

      assert_components(component, expected_component)
    end
  end

  defp assert_components(rendered_component, expected_component) do
    rendered_component_str = rendered_to_string(rendered_component) |> remove_whitespace()
    expected_component_str = rendered_to_string(expected_component) |> remove_whitespace()
    assert rendered_component_str == expected_component_str
  end

  defp remove_whitespace(str) do
    str
    |> String.replace(~r/\s+/, "")
    |> String.trim()
  end
end
