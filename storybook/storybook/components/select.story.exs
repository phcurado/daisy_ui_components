defmodule Storybook.Components.Select do
  use PhoenixStorybook.Story, :component

  alias DaisyUIComponents.Select
  alias DaisyUIComponents.Utils

  def function, do: &Select.select/1

  def imports,
    do: [
      {DaisyUIComponents.Icon, [icon: 1]}
    ]

  def variations do
    [
      %Variation{
        id: :select,
        attributes: %{
          class: "w-full max-w-xs"
        },
        slots: [
          """
          <option disabled selected>Pick your favorite Simpson</option>
          <option>Homer</option>
          <option>Marge</option>
          <option>Bart</option>
          <option>Lisa</option>
          <option>Maggie</option>
          """
        ]
      },
      %Variation{
        id: :select_ghost,
        attributes: %{
          ghost: true,
          class: "w-full max-w-xs"
        },
        slots: [
          """
          <option disabled selected>Who shot first?</option>
          <option>Han Solo</option>
          <option>Greedo</option>
          """
        ]
      },
      %VariationGroup{
        id: :colors,
        variations:
          for color <- Utils.colors() do
            %Variation{
              id: String.to_atom(color),
              attributes: %{
                class: "w-full max-w-xs",
                color: color
              },
              slots: [
                """
                <option disabled selected>Choose the best movie</option>
                <option>The Godfather 1</option>
                <option>The Godfather 2</option>
                <option>The Godfather 3</option>
                """
              ]
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
                class: "w-full max-w-xs",
                size: size
              },
              slots: [
                """
                <option disabled selected>Choose the best movie</option>
                <option>The Godfather 1</option>
                <option>The Godfather 2</option>
                <option>The Godfather 3</option>
                """
              ]
            }
          end
      },
      %Variation{
        id: :select_disabled,
        attributes: %{
          disabled: true,
          class: "w-full max-w-xs"
        },
        slots: [
          """
          <option>Disabled</option>
          """
        ]
      }
    ]
  end
end
