defmodule DaisyUIComponents.ProgressTest do
  use DaisyUIComponents.ComponentCase

  import DaisyUIComponents.Progress

  test "progress" do
    assigns = %{}

    ~H"""
    <.progress value="10" max="100" />
    """
    |> parse_component()
    |> assert_component("progress")
    |> assert_class("progress")
    |> assert_attribute("value", "10")
    |> assert_attribute("max", "100")
  end

  test "progress colors" do
    for color <- progress_colors() do
      assigns = %{color: color}

      ~H"""
      <.progress color={@color} />
      """
      |> parse_component()
      |> assert_component("progress")
      |> assert_class("progress progress-#{color}")
    end
  end
end
