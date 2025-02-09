defmodule DaisyUIComponents.JoinTest do
  use ExUnit.Case

  import Phoenix.Component
  import Phoenix.LiveViewTest
  import DaisyUIComponents.Button
  import DaisyUIComponents.Join

  test "join" do
    assigns = %{}

    join =
      rendered_to_string(~H"""
      <.join>
        <.button active class="join-item">1</.button>
        <.button class="join-item">2</.button>
      </.join>
      """)

    assert join =~ ~s(<div class="join">)
    assert join =~ ~s(<button class="btn btn-active join-item">)
    assert join =~ ~s(<button class="btn join-item">)
  end

  test "Join direction" do
    for direction <- ["horizontal", "vertical"] do
      assigns = %{direction: direction}

      assert rendered_to_string(~H"""
             <.join direction={@direction}>
               <.button active>1</.button>
             </.join>
             """) =~ ~s(<div class="join join-#{direction}">)
    end
  end
end
