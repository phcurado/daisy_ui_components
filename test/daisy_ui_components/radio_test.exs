defmodule DaisyUIComponents.RadioTest do
  use ExUnit.Case

  import Phoenix.Component
  import Phoenix.LiveViewTest
  import DaisyUIComponents.Radio

  alias DaisyUIComponents.Utils

  test "radio" do
    assigns = %{}

    radio =
      rendered_to_string(~H"""
      <.radio value="true" />
      """)

    assert radio =~ ~s(<input class="radio" type="radio" value="true">)
  end

  test "radio colors" do
    for color <- Utils.colors() do
      assigns = %{color: color}

      assert rendered_to_string(~H"""
             <.radio color={@color} />
             """) =~ ~s(<input class="radio radio-#{color}" type="radio">)
    end
  end

  test "radio sizes" do
    for size <- Utils.sizes() do
      assigns = %{size: size}

      assert rendered_to_string(~H"""
             <.radio size={@size} />
             """) =~ ~s(<input class="radio radio-#{size}" type="radio">)
    end
  end
end
