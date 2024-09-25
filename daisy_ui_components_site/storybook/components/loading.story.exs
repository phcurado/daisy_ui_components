defmodule Storybook.Components.Loading do
  use PhoenixStorybook.Story, :component


  def function, do: &DaisyUIComponents.Loading.loading/1

  def variations do
    [
      %Variation{
        id: :default,
        attributes: %{
          loading: true,
          shape: "bars",
          color: "warning"
        }
      }
    ]
  end
end
