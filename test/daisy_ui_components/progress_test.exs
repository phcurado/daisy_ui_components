defmodule DaisyUIComponents.ProgressTest do
  use DaisyUIComponents.ComponentCase

  import DaisyUIComponents.Progress

  test "progress" do
    assigns = %{}

    ~H"""
    <.progress min="10" max="100" />
    """
    |> parse_component()
    |> assert_attribute("min", "10")
    |> assert_attribute("max", "100")
    |> assert_attribute("class", "progress")
  end

  test "progress colors" do
    for color <- progress_colors() do
      assigns = %{color: color}

      ~H"""
      <.progress color={@color} />
      """
      |> parse_component()
      |> assert_attribute("class", "progress progress-#{color}")
    end
  end
end
