defmodule DaisyUIComponents.LoadingTest do
  use ExUnit.Case

  import Phoenix.Component
  import Phoenix.LiveViewTest
  import DaisyUIComponents.Loading

  alias DaisyUIComponents.Utils

  test "loading" do
    assigns = %{}

    button =
      rendered_to_string(~H"""
      <.loading></.loading>
      """)

    assert button =~ ~s(<span class="loading">)
  end

  test "loading colors" do
    for color <- Utils.colors() ++ ["neutral"] do
      assigns = %{color: color}

      assert rendered_to_string(~H"""
             <.loading color={@color}></.loading>
             """) =~ ~s(<span class="loading text-#{color}">)
    end
  end

  test "loading sizes" do
    for size <- Utils.sizes() do
      assigns = %{size: size}

      assert rendered_to_string(~H"""
             <.loading size={@size}></.loading>
             """) =~ ~s(<span class="loading loading-#{size}">)
    end
  end

  test "loading shapes" do
    for shape <- ~w(spinner dots ring ball bars infinity) do
      assigns = %{shape: shape}

      assert rendered_to_string(~H"""
             <.loading shape={@shape}></.loading>
             """) =~ ~s(<span class="loading loading-#{shape}">)
    end
  end

  test "combined size, color and shape" do
    size = "lg"
    shape = "infinity"
    color = "warning"
    id = "loading-lg-infinity-warn"
    assigns = %{id: id, size: size, shape: shape, color: color}

    assert rendered_to_string(~H"""
           <.loading id={@id} shape={@shape} size={@size} color={@color}></.loading>
           """) =~
             ~s(<span class="loading loading-#{shape} text-#{color} loading-#{size}" id="#{id}">)
  end
end
