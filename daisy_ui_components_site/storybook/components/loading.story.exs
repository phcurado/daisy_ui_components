defmodule Storybook.Components.Loading do
  use PhoenixStorybook.Story, :component

  alias DaisyUIComponents.Utils


  def function, do: &DaisyUIComponents.Loading.loading/1

  def variations do
    [
      %Variation{
        id: :dots_warning_large,
        attributes: %{
          shape: "dots",
          color: "warning",
          size: "lg"
        }
      },
      %VariationGroup{
        id: :colors,
        variations:
          for color <- Utils.colors() ++ ["neutral"] do
            %Variation{
              id: String.to_atom(color),
              attributes: %{
                color: color
              }
            }
          end
      },

      %VariationGroup{
        id: :sizes,
        variations:
          for size <- Utils.sizes()  do
            %Variation{
              id: String.to_atom(size),
              attributes: %{
                size: size
              }
            }
          end
      },
      %VariationGroup{
        id: :shapes,
        variations:
          for shape <- ~w(spinner dots ring ball bars infinity) do
            %Variation{
              id: String.to_atom(shape),
              attributes: %{
                shape: shape
              }
            }
          end
      },
    ]
  end
end
