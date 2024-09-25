defmodule Storybook.Components.Loading do
  use PhoenixStorybook.Story, :component


  def function, do: &DaisyUIComponents.Loading.loading/1

  def variations do
    [
      %Variation{
        id: :dots_warning_large,
        attributes: %{
          loading: true,
          shape: "dots",
          color: "warning",
          size: "lg"
        }
      }
    ]
  end
end
