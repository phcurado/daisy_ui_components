defmodule Storybook.Components.Badge do
  use PhoenixStorybook.Story, :component

  alias DaisyUIComponents.Button
  alias DaisyUIComponents.Icon
  alias DaisyUIComponents.Utils

  def function, do: &DaisyUIComponents.Badge.badge/1

  def imports, do: [{Button, button: 1}, {Icon, icon: 1}]

  def variations do
    [
      %Variation{
        id: :badge,
        slots: ["badge"]
      },
      %VariationGroup{
        id: :badge_with_colors,
        variations:
          [
            %Variation{
              id: :default,
              slots: ["default"]
            }
          ] ++
            for color <- ["neutral"] ++ Utils.colors() do
              %Variation{
                id: String.to_atom(color),
                attributes: %{
                  color: color
                },
                slots: ["#{color}"]
              }
            end
      },
      %Variation{
        id: :badge_outline,
        attributes: %{
          outline: true
        },
        slots: ["badge"]
      },
      %VariationGroup{
        id: :sizes,
        variations:
          for size <- Utils.sizes() do
            %Variation{
              id: String.to_atom(size),
              attributes: %{
                size: size
              },
              slots: ["987,654"]
            }
          end
      },
      %VariationGroup{
        id: :empty_badge,
        variations:
          for size <- Utils.sizes() do
            %Variation{
              id: String.to_atom(size),
              attributes: %{
                size: size,
                color: "primary"
              }
            }
          end
      },
      %VariationGroup{
        id: :badge_with_state_colors,
        variations:
          for color <- ["info", "success", "warning", "error"] do
            %Variation{
              id: String.to_atom(color),
              attributes: %{
                color: color
              },
              slots: [
                """
                <.icon name="hero-x-mark" />
                """,
                "#{color}"
              ]
            }
          end
      },
      %Variation{
        id: :badge_in_a_text,
        template: """
        <h2 class="text-xl">
          Heading
          <.psb-variation/>
        </h2>
        """,
        attributes: %{
          size: "xl"
        },
        slots: ["NEW"]
      },
      %Variation{
        id: :badge_in_a_button,
        template: """
        <.button>
          Inbox
          <.psb-variation/>
        </.button>
        """,
        attributes: %{
          color: "secondary"
        },
        slots: ["+99"]
      }
    ]
  end
end
