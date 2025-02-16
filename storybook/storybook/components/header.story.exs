defmodule Storybook.Components.Header do
  use PhoenixStorybook.Story, :component

  alias DaisyUIComponents.Button
  alias DaisyUIComponents.Header

  def function, do: &Header.header/1

  def imports,
    do: [
      {Button, [button: 1]}
    ]

  def variations do
    [
      %Variation{
        id: :header,
        slots: [
          """
          Welcome
          """
        ]
      },
      %Variation{
        id: :header_with_slots,
        slots: [
          """
          Welcome
          <:subtitle>
           to DaisyUIComponents
          </:subtitle>
          <:actions>
            <.button>
              Continue
            </.button>
          </:actions>
          """
        ]
      }
    ]
  end
end
