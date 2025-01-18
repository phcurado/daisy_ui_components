defmodule Storybook.Components.Swap do
  use PhoenixStorybook.Story, :component

  alias DaisyUIComponents.Utils

  def function, do: &DaisyUIComponents.Swap.swap/1

  def imports, do: []

  def variations do
    [
      %Variation{
        id: :swap_text,
        slots: [
          """
          <:swap_on name="ON" />
          """,
          """
          <:swap_off name="OFF" />
          """
        ]
      },
      %Variation{
        id: :swap_icon,
        slots: [
          """
          <:swap_on type="icon" name="hero-speaker-wave" />
          """,
          """
          <:swap_off type="icon" name="hero-speaker-x-mark" />
          """
        ]
      },
      %Variation{
        id: :swap_icon_with_rotate_effect,
        attributes: %{
          animation: "rotate"
        },
        slots: [
          """
          <:swap_on type="icon" name="hero-sun" />
          """,
          """
          <:swap_off type="icon" name="hero-moon" />
          """
        ]
      },
      %Variation{
        id: :swap_icon_with_flip_effect,
        attributes: %{
          animation: "flip"
        },
        slots: [
          """
          <:swap_on name="😈" />
          """,
          """
          <:swap_off name="😇" />
          """
        ]
      },
      %Variation{
        id: :hamburger_button,
        attributes: %{
          animation: "rotate"
        },
        slots: [
          """
          <:swap_on type="icon" name="hero-x-mark" />

          """,
          """
          <:swap_off type="icon" name="hero-bars-3" />
          """
        ]
      },
    ]
  end
end
