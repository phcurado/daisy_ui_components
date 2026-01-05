defmodule Storybook.Components.Steps do
  use PhoenixStorybook.Story, :component

  alias DaisyUIComponents.Steps

  def function, do: &Steps.steps/1

  def imports, do: [{Steps, step: 1}]

  def variations do
    [
      %Variation{
        id: :basic_steps,
        slots: [
          """
          <.step color="primary">Register</.step>
          <.step color="primary">Choose plan</.step>
          <.step>Purchase</.step>
          <.step>Receive Product</.step>
          """
        ]
      },
      %Variation{
        id: :vertical_steps,
        attributes: %{
          vertical: true
        },
        slots: [
          """
          <.step color="primary">Register</.step>
          <.step color="primary">Choose plan</.step>
          <.step>Purchase</.step>
          <.step>Receive Product</.step>
          """
        ]
      },
      %VariationGroup{
        id: :step_colors,
        variations:
          for color <- Steps.step_colors() do
            %Variation{
              id: String.to_atom(color),
              slots: [
                """
                <.step color="#{color}">Step 1</.step>
                <.step color="#{color}">Step 2</.step>
                <.step>Step 3</.step>
                """
              ]
            }
          end
      },
      %Variation{
        id: :with_data_content,
        slots: [
          """
          <.step content="?" color="neutral">Step 1</.step>
          <.step content="!" color="neutral">Step 2</.step>
          <.step content="*" color="neutral">Step 3</.step>
          <.step content="*" color="neutral">Step 4</.step>
          """
        ]
      }
    ]
  end
end
