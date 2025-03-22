defmodule Storybook.Components.Card do
  use PhoenixStorybook.Story, :component

  alias DaisyUIComponents.Card

  def function, do: &Card.card/1

  def imports,
    do: [
      {Card, card_actions: 1}
    ]

  def variations do
    [
      %Variation{
        id: :card,
        attributes: %{
          class: "bg-base-200 w-96 shadow-xl"
        },
        slots: [
          """
          <figure>
            <img
              src="https://img.daisyui.com/images/stock/photo-1606107557195-0e29a4b5b4aa.webp"
              alt="Shoes" />
          </figure>
          <:card_title>Shoes!</:card_title>
          <:card_body>
            <p>If a dog chews shoes whose shoes does he choose?</p>
          </:card_body>
          <:card_actions class="justify-end">
            <button class="btn btn-primary">Buy Now</button>
          </:card_actions>
          """
        ]
      },
      %VariationGroup{
        id: :modifiers,
        variations:
          for modifier <- Card.modifiers() do
            %Variation{
              id: String.to_atom(modifier),
              attributes: %{
                class: "bg-base-200 w-96 shadow-xl",
                modifier: modifier
              },
              slots: [
                """
                <figure>
                  <img
                    src="https://img.daisyui.com/images/stock/photo-1606107557195-0e29a4b5b4aa.webp"
                    alt="Shoes" />
                </figure>
                <:card_title>Shoes!</:card_title>
                <:card_body>
                  <p>If a dog chews shoes whose shoes does he choose?</p>
                </:card_body>
                <:card_actions class="justify-end">
                  <button class="btn btn-primary">Buy Now</button>
                </:card_actions>
                """
              ]
            }
          end
      },
      %Variation{
        id: :compact,
        attributes: %{
          class: "bg-base-200 w-96 shadow-xl",
          padding: "compact"
        },
        slots: [
          """
          <figure>
            <img
              src="https://img.daisyui.com/images/stock/photo-1606107557195-0e29a4b5b4aa.webp"
              alt="Shoes" />
          </figure>
          <:card_title>Shoes!</:card_title>
          <:card_body>
            <p>If a dog chews shoes whose shoes does he choose?</p>
          </:card_body>
          <:card_actions class="justify-end">
            <button class="btn btn-primary">Buy Now</button>
          </:card_actions>
          """
        ]
      },
      %Variation{
        id: :card_with_bottom_image,
        attributes: %{
          class: "bg-base-200 w-96 shadow-xl",
          placement: "bottom"
        },
        slots: [
          """
          <figure>
            <img
              src="https://img.daisyui.com/images/stock/photo-1606107557195-0e29a4b5b4aa.webp"
              alt="Shoes" />
          </figure>
          <:card_title>Shoes!</:card_title>
          <:card_body>
            <p>If a dog chews shoes whose shoes does he choose?</p>
          </:card_body>
          <:card_actions class="justify-end">
            <button class="btn btn-primary">Buy Now</button>
          </:card_actions>
          """
        ]
      },
      %Variation{
        id: :card_with_no_image,
        attributes: %{
          class: "bg-base-200 w-96 shadow-xl"
        },
        slots: [
          """
          <:card_title>Shoes!</:card_title>
          <:card_body>
            <p>If a dog chews shoes whose shoes does he choose?</p>
          </:card_body>
          <:card_actions class="justify-end">
            <button class="btn btn-primary">Buy Now</button>
          </:card_actions>
          """
        ]
      }
    ]
  end
end
