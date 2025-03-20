defmodule Storybook.Components.Textarea do
  use PhoenixStorybook.Story, :component

  alias DaisyUIComponents.Textarea
  alias DaisyUIComponents.Utils

  def function, do: &Textarea.textarea/1

  def imports,
    do: []

  def variations do
    [
      %Variation{
        id: :textarea,
        attributes: %{
          placeholder: "Bio"
        }
      },
      %Variation{
        id: :textarea_ghost,
        attributes: %{
          ghost: true,
          placeholder: "Bio"
        }
      },
      %VariationGroup{
        id: :colors,
        variations:
          for color <- Utils.colors() do
            %Variation{
              id: String.to_atom(color),
              attributes: %{
                placeholder: "Bio",
                color: color
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
                placeholder: "Bio",
                size: size
              }
            }
          end
      },
      %Variation{
        id: :textarea_disabled,
        attributes: %{
          disabled: true,
          placeholder: "Bio"
        }
      }
    ]
  end
end
