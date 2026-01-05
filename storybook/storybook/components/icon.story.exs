defmodule Storybook.Components.Icon do
  use PhoenixStorybook.Story, :component

  def function, do: &DaisyUIComponents.Icon.icon/1

  def variations do
    [
      %Variation{
        id: :outline_icon,
        attributes: %{
          name: "hero-user"
        }
      },
      %Variation{
        id: :solid_icon,
        attributes: %{
          name: "hero-user-solid"
        }
      },
      %Variation{
        id: :mini_icon,
        attributes: %{
          name: "hero-user-mini"
        }
      },
      %Variation{
        id: :icon_with_size,
        attributes: %{
          name: "hero-star-solid",
          class: "w-8 h-8"
        }
      },
      %Variation{
        id: :icon_with_color,
        attributes: %{
          name: "hero-heart-solid",
          class: "w-6 h-6 text-red-500"
        }
      },
      %VariationGroup{
        id: :common_icons,
        variations:
          for icon <- ~w(home cog bell check x-mark arrow-left arrow-right) do
            %Variation{
              id: String.to_atom(icon),
              attributes: %{
                name: "hero-#{icon}",
                class: "w-6 h-6"
              }
            }
          end
      }
    ]
  end
end
