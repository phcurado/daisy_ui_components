defmodule Storybook.Components.TextInput do
  use PhoenixStorybook.Story, :component

  alias DaisyUIComponents.Utils

  def function, do: &DaisyUIComponents.TextInput.text_input/1

  def imports,
    do: [
      {DaisyUIComponents.Icon, [icon: 1]}
    ]

  def variations do
    [
      %Variation{
        id: :text_input,
        attributes: %{
          type: "text",
          placeholder: "Type here",
          class: "w-full max-w-xs"
        }
      },
      %Variation{
        id: :text_input_with_border,
        attributes: %{
          type: "text",
          bordered: true,
          placeholder: "Type here",
          class: "w-full max-w-xs"
        }
      },
      %Variation{
        id: :text_input_ghost,
        attributes: %{
          type: "text",
          ghost: true,
          placeholder: "Type here",
          class: "w-full max-w-xs"
        }
      },
      %VariationGroup{
        id: :colors,
        variations:
          for color <- Utils.colors() do
            %Variation{
              id: String.to_atom(color),
              attributes: %{
                type: "text",
                bordered: true,
                placeholder: "Type here",
                class: "w-full max-w-xs",
                color: color
              }
            }
          end
      },
      %Variation{
        id: :text_input_disabled,
        attributes: %{
          type: "text",
          disabled: true,
          placeholder: "You can't touch this",
          class: "w-full max-w-xs"
        }
      }
    ]
  end
end
