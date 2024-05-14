defmodule Storybook.Components.Button do
  use PhoenixStorybook.Story, :component

  alias DaisyUIComponents.Utils

  def function, do: &DaisyUIComponents.Button.button/1

  def imports,
    do: [
      {DaisyUIComponents.Icon, [icon: 1]}
    ]

  def variations do
    [
      %Variation{
        id: :default,
        slots: ["Button"]
      },
      %VariationGroup{
        id: :colors,
        variations:
          for color <- Utils.colors() ++ ["neutral"] do
            %Variation{
              id: String.to_atom(color),
              attributes: %{
                color: color
              },
              slots: [String.capitalize(color)]
            }
          end
      },
      %Variation{
        id: :outline,
        attributes: %{
          outline: true
        },
        slots: ["Button"]
      },
      %Variation{
        id: :active,
        attributes: %{
          active: true
        },
        slots: ["Active"]
      },
      %Variation{
        id: :disabled,
        attributes: %{
          disabled: true
        },
        slots: ["Disabled"]
      },
      %VariationGroup{
        id: :button_sizes,
        variations:
          for size <- Utils.sizes() do
            %Variation{
              id: String.to_atom(size),
              attributes: %{
                size: size
              },
              slots: [String.capitalize(size)]
            }
          end
      },
      %Variation{
        id: :wide,
        attributes: %{
          wide: true
        },
        slots: ["Wide"]
      },
      %Variation{
        id: :square,
        attributes: %{
          shape: "square"
        },
        slots: [
          """
          <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12" /></svg>
          """
        ]
      },
      %Variation{
        id: :circle,
        attributes: %{
          shape: "circle"
        },
        slots: [
          """
          <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12" /></svg>
          """
        ]
      },
      %Variation{
        id: :icon_at_start,
        slots: [
          """
          <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4.318 6.318a4.5 4.5 0 000 6.364L12 20.364l7.682-7.682a4.5 4.5 0 00-6.364-6.364L12 7.636l-1.318-1.318a4.5 4.5 0 00-6.364 0z" /></svg>
          """,
          "Button"
        ]
      },
      %Variation{
        id: :icon_at_end,
        slots: [
          "Button",
          """
          <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4.318 6.318a4.5 4.5 0 000 6.364L12 20.364l7.682-7.682a4.5 4.5 0 00-6.364-6.364L12 7.636l-1.318-1.318a4.5 4.5 0 00-6.364 0z" /></svg>
          """
        ]
      },
      %Variation{
        id: :block,
        attributes: %{
          block: true
        },
        slots: ["Button"]
      },
      %Variation{
        id: :button_loading_with_a_spinner,
        attributes: %{
          shape: "square"
        },
        slots: [
          """
          <span class="loading loading-spinner"></span>
          """
        ]
      },
      %Variation{
        id: :button_loading_with_spinner_and_text,
        attributes: %{
          shape: "square"
        },
        slots: [
          """
          <span class="loading loading-spinner"></span>
          """,
          "loading"
        ]
      },
      %Variation{
        id: :button_without_click_animation,
        attributes: %{
          class: "no-animation"
        },
        slots: ["I don't have click animation"]
      }
    ]
  end
end
