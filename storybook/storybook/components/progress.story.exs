defmodule Storybook.Components.Progress do
  use PhoenixStorybook.Story, :component

  alias DaisyUIComponents.Progress

  def function, do: &Progress.progress/1

  def variations do
    [
      %Variation{
        id: :default,
        attributes: %{
          value: "50",
          max: "100"
        }
      },
      %VariationGroup{
        id: :colors,
        variations:
          Enum.with_index(Progress.progress_colors())
          |> Enum.map(fn {color, index} ->
            %Variation{
              id: String.to_atom(color),
              attributes: %{
                color: color,
                value: (index + 3) * 10,
                max: 100
              }
            }
          end)
      },
      %Variation{
        id: :indeterminate,
        attributes: %{
          max: "100"
        }
      }
    ]
  end
end
