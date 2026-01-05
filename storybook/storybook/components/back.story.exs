defmodule Storybook.Components.Back do
  use PhoenixStorybook.Story, :component

  def function, do: &DaisyUIComponents.Back.back/1

  def variations do
    [
      %Variation{
        id: :basic_back,
        attributes: %{
          navigate: "/"
        },
        slots: ["Back to home"]
      },
      %Variation{
        id: :back_to_posts,
        attributes: %{
          navigate: "/posts"
        },
        slots: ["Back to posts"]
      },
      %Variation{
        id: :back_with_longer_text,
        attributes: %{
          navigate: "/dashboard"
        },
        slots: ["Return to Dashboard"]
      }
    ]
  end
end
