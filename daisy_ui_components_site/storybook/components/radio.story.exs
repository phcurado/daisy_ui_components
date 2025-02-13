defmodule Storybook.Components.Radio do
  use PhoenixStorybook.Story, :component

  alias DaisyUIComponents.Radio
  alias DaisyUIComponents.Utils

  def function, do: &Radio.radio/1

  def imports, do: []

  def variations do
    [
      %Variation{
        id: :default
      },
      %VariationGroup{
        id: :colors,
        variations:
          for color <- Utils.colors() do
            %Variation{
              id: String.to_atom(color),
              attributes: %{
                color: color,
                checked: "checked"
              }
            }
          end
      },
      %VariationGroup{
        id: :sizes,
        variations:
          for size <- Utils.sizes() do
            %Variation{
              id: String.to_atom(size),
              attributes: %{
                size: size
              }
            }
          end
      }
    ]
  end
end
