defmodule Storybook.Components.Label do
  use PhoenixStorybook.Story, :component

  alias DaisyUIComponents.Input
  alias DaisyUIComponents.Label

  def function, do: &Label.label/1

  def imports,
    do: [
      {Input, [input: 1]}
    ]

  def variations do
    [
      %Variation{
        id: :label_for_input,
        attributes: %{
          type: "input",
          text: "https://"
        },
        slots: [
          """
          <input type="text" placeholder="URL" />
          """
        ]
      },
      %Variation{
        id: :label_for_input_at_the_end,
        attributes: %{
          type: "input",
          position: "end",
          text: ".com"
        },
        slots: [
          """
          <input type="text" placeholder="domain name" />
          """
        ]
      },
      %Variation{
        id: :label_for_select,
        attributes: %{
          type: "select",
          text: "Type"
        },
        slots: [
          """
          <select>
            <option>Personal</option>
            <option>Business</option>
          </select>
          """
        ]
      },
      %Variation{
        id: :label_for_date_input,
        attributes: %{
          type: "input",
          text: "Publish Date"
        },
        slots: [
          """
          <input type="date" />
          """
        ]
      },
      %VariationGroup{
        id: :sizes,
        variations: [
          %Variation{
            id: :xs,
            attributes: %{
              type: "floating",
              text: "Extra Small"
            },
            slots: [
              """
              <.input type="text" placeholder="Extra Small" size="xs" />
              """
            ]
          },
          %Variation{
            id: :sm,
            attributes: %{
              type: "floating",
              text: "Small"
            },
            slots: [
              """
              <.input type="text" placeholder="Small" size="sm" />
              """
            ]
          },
          %Variation{
            id: :md,
            attributes: %{
              type: "floating",
              text: "Medium"
            },
            slots: [
              """
              <.input type="text" placeholder="Medium" size="md" />
              """
            ]
          },
          %Variation{
            id: :lg,
            attributes: %{
              type: "floating",
              text: "Large"
            },
            slots: [
              """
              <.input type="text" placeholder="Large" size="lg" />
              """
            ]
          },
          %Variation{
            id: :xl,
            attributes: %{
              type: "floating",
              text: "Extra Large"
            },
            slots: [
              """
              <.input type="text" placeholder="Extra Large" size="xl" />
              """
            ]
          }
        ]
      }
    ]
  end
end
