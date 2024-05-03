defmodule DaisyUIComponents.TooltipTest do
  use ExUnit.Case

  import Phoenix.Component
  import Phoenix.LiveViewTest
  import DaisyUIComponents.Button
  import DaisyUIComponents.Tooltip

  alias DaisyUIComponents.Utils

  test "tooltip" do
    assigns = %{}

    tooltip =
      rendered_to_string(~H"""
      <.tooltip text="hello">
        <.button>World</.button>
      </.tooltip>
      """)

    assert tooltip =~ ~s(<div class="tooltip" data-tip="hello">)
    assert tooltip =~ ~s(<button class="btn">)
  end

  test "tooltip direction" do
    for direction <- ["left", "top", "right", "bottom"] do
      assigns = %{direction: direction}

      assert rendered_to_string(~H"""
             <.tooltip text="hello" direction={@direction}>
               <.button active>Hi</.button>
             </.tooltip>
             """) =~ ~s(<div class="tooltip tooltip-#{direction}" data-tip="hello">)
    end
  end

  test "tooltip color" do
    for color <- Utils.colors() do
      assigns = %{color: color}

      assert rendered_to_string(~H"""
             <.tooltip text="hello" color={@color}>
               <.button active>Hi</.button>
             </.tooltip>
             """) =~ ~s(<div class="tooltip tooltip-#{color}" data-tip="hello">)
    end
  end

  test "tooltip open" do
    assigns = %{}

    assert rendered_to_string(~H"""
           <.tooltip text="hello" open={true}>
             <.button active>Hi</.button>
           </.tooltip>
           """) =~ ~s(<div class="tooltip tooltip-open" data-tip="hello">)
  end
end
