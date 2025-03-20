defmodule Storybook.Components.Input do
  use PhoenixStorybook.Story, :component

  alias DaisyUIComponents.Input

  def function, do: &Input.input/1
  def imports, do: []

  def template do
    """
    <div class="flex flex-col items-center gap-5 w-full">
      <.psb-variation-group />
    </div>
    """
  end

  def variations do
    [
      %VariationGroup{
        id: :basic_inputs,
        variations:
          for type <- ~w(text textarea number date color range checkbox radio)a do
            %Variation{
              id: type,
              attributes: %{
                type: to_string(type),
                placeholder: String.capitalize("#{type} input")
              }
            }
          end
      },
      %Variation{
        id: :select,
        attributes: %{
          label: "Select input",
          type: "select",
          options: ["Option 1", "Option 2", "Option 3"]
        }
      }
    ]
  end
end
