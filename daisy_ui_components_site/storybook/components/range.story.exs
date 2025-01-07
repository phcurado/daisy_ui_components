defmodule Storybook.Components.Range do
  use PhoenixStorybook.Story, :component

  alias DaisyUIComponents.Utils

  def function, do: &DaisyUIComponents.Range.range/1

  def imports, do: []

  def variations do
    [
      %Variation{
        id: :range,
        attributes: %{
          min: 0,
          max: 100,
          value: 40
        }
      },
      %VariationGroup{
        id: :colors,
        variations:
          for {color, index} <- Enum.with_index(Utils.colors()) do
            %Variation{
              id: String.to_atom(color),
              attributes: %{
                color: color,
                min: 0,
                max: 100,
                value: 30 + 10 * index
              }
            }
          end
      },
      %VariationGroup{
        id: :sizes,
        variations:
          for {size, index} <- Enum.with_index(Utils.sizes()) do
            %Variation{
              id: String.to_atom(size),
              attributes: %{
                size: size,
                min: 0,
                max: 100,
                value: 40 + 10 * index
              }
            }
          end
      }
    ]
  end
end
