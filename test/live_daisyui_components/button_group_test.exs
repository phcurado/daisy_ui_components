defmodule LiveDaisyuiComponents.ButtonGroupTest do
  use ExUnit.Case

  import Phoenix.Component
  import Phoenix.LiveViewTest
  import LiveDaisyuiComponents.Button
  import LiveDaisyuiComponents.ButtonGroup

  alias LiveDaisyuiComponents.Utils

  test "button_group" do
    assigns = %{}

    button_group =
      rendered_to_string(~H"""
      <.button_group>
        <.button active>1</.button>
        <.button>2</.button>
      </.button_group>
      """)

    assert button_group =~ ~s(<div class="btn-group">)
    assert button_group =~ ~s(<button class="btn btn-active">)
  end

  test "button group direction" do
    for direction <- Utils.directions() do
      assigns = %{direction: direction}

      assert rendered_to_string(~H"""
             <.button_group direction={@direction}>
               <.button active>1</.button>
             </.button_group>
             """) =~ ~s(<div class="btn-group btn-group-#{direction}">)
    end
  end
end
