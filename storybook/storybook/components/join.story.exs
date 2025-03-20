defmodule Storybook.Components.Join do
  use PhoenixStorybook.Story, :component

  alias DaisyUIComponents.Button
  alias DaisyUIComponents.Input
  alias DaisyUIComponents.Join
  alias DaisyUIComponents.Select
  alias DaisyUIComponents.Utils

  def function, do: &Join.join/1

  def imports, do: [{Button, button: 1}, {Input, input: 1}, {Select, select: 1}]

  def variations do
    [
      %VariationGroup{
        id: :join,
        variations:
          for direction <- Join.directions() do
            %Variation{
              id: String.to_atom(direction),
              attributes: %{
                direction: direction
              },
              slots: [
                """
                <.button class="join-item">Button</.button>
                <.button class="join-item">Button</.button>
                <.button class="join-item">Button</.button>
                """
              ]
            }
          end
      },
      %Variation{
        id: :responsive,
        description: "Responsive: it's vertical on small screen and horizontal on large screen",
        attributes: %{
          class: "join-vertical lg:join-horizontal"
        },
        slots: [
          """
          <.button class="join-item">Button</.button>
          <.button class="join-item">Button</.button>
          <.button class="join-item">Button</.button>
          """
        ]
      },
      %Variation{
        id: :extra_elements,
        description: "With extra elements in the group",
        slots: [
          """
          <div class="join">
            <div>
              <div>
                <.input class="join-item" placeholder="Search" />
              </div>
            </div>
            <.select class="join-item">
              <option disabled selected>Filter</option>
              <option>Sci-fi</option>
              <option>Drama</option>
              <option>Action</option>
            </.select>
            <div class="indicator">
              <span class="indicator-item badge badge-secondary">new</span>
              <button class="btn join-item">Search</button>
            </div>
          </div>
          """
        ]
      },
      %Variation{
        id: :custom_border_radius,
        slots: [
          """
          <.input class="join-item" placeholder="Email" />
          <.button class="join-item rounded-r-full">Subscribe</.button>
          """
        ]
      },
      %Variation{
        id: :join_radio,
        description: "Join radio inputs with btn style",
        slots: [
          """
          <input class="join-item btn" type="radio" name="options" aria-label="Radio 1" />
          <input class="join-item btn" type="radio" name="options" aria-label="Radio 2" />
          <input class="join-item btn" type="radio" name="options" aria-label="Radio 3" />
          """
        ]
      }
    ]
  end
end
