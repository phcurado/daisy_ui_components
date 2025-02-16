defmodule Storybook.Components.Tooltip do
  use PhoenixStorybook.Story, :component

  alias DaisyUIComponents.Button
  alias DaisyUIComponents.Tooltip
  alias DaisyUIComponents.Utils

  def function, do: &Tooltip.tooltip/1

  def imports, do: [{Button, button: 1}]

  def variations do
    [
      %Variation{
        id: :tooltip,
        attributes: %{
          text: "hello"
        },
        slots: [
          """
          <.button>Hover me</.button>
          """
        ]
      },
      %Variation{
        id: :tooltip_force_open,
        attributes: %{
          text: "hello",
          open: true
        },
        slots: [
          """
          <.button>Force open</.button>
          """
        ]
      },
      %VariationGroup{
        id: :directions,
        variations:
          for direction <- Utils.directions() do
            %Variation{
              id: String.to_atom(direction),
              attributes: %{
                text: direction,
                direction: direction
              },
              slots: [
                """
                <.button>Hover me</.button>
                """
              ]
            }
          end
      },
      %VariationGroup{
        id: :colors,
        variations:
          for color <- Utils.colors() do
            %Variation{
              id: String.to_atom(color),
              attributes: %{
                text: color,
                color: color
              },
              slots: [
                """
                <.button>Hover me</.button>
                """
              ]
            }
          end
      }
    ]
  end
end
