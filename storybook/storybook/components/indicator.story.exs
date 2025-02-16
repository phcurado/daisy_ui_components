defmodule Storybook.Components.Indicator do
  use PhoenixStorybook.Story, :component

  alias DaisyUIComponents.Badge
  alias DaisyUIComponents.Button
  alias DaisyUIComponents.Indicator
  alias DaisyUIComponents.Input

  def function, do: &Indicator.indicator/1

  def imports, do: [{Badge, badge: 1}, {Button, button: 1}, {Input, input: 1}]

  def variations do
    [
      %Variation{
        id: :indicator_badge,
        slots: [
          """
          <:badge color="success">hi</:badge>
          <div class="bg-base-300 grid h-32 w-32 place-items-center">content</div>
          """
        ]
      },
      %Variation{
        id: :indicator_badge_with_content,
        slots: [
          """
          <:badge color="primary">new</:badge>
          <div class="bg-base-300 grid h-32 w-32 place-items-center">content</div>
          """
        ]
      },
      %Variation{
        id: :indicator_for_button,
        slots: [
          """
          <:badge color="secondary">99+</:badge>
          <.button>Inbox</.button>
          """
        ]
      },
      %Variation{
        id: :indicator_for_input,
        slots: [
          """
          <:badge>Required</:badge>
          <.input bordered placeholder="Your email address" />
          """
        ]
      },
      %Variation{
        id: :indicator_start,
        slots: [
          """
          <:badge color="secondary" align="start"></:badge>
          <div class="bg-base-300 grid h-32 w-32 place-items-center">content</div>
          """
        ]
      },
      %Variation{
        id: :indicator_center,
        slots: [
          """
          <:badge color="secondary" align="center"></:badge>
          <div class="bg-base-300 grid h-32 w-32 place-items-center">content</div>
          """
        ]
      },
      %Variation{
        id: :indicator_end,
        slots: [
          """
          <:badge color="secondary" align="end"></:badge>
          <div class="bg-base-300 grid h-32 w-32 place-items-center">content</div>
          """
        ]
      },
      %Variation{
        id: :indicator_middle_start,
        slots: [
          """
          <:badge color="secondary" direction="middle" align="start"></:badge>
          <div class="bg-base-300 grid h-32 w-32 place-items-center">content</div>
          """
        ]
      },
      %Variation{
        id: :indicator_middle_center,
        slots: [
          """
          <:badge color="secondary" direction="middle" align="center"></:badge>
          <div class="bg-base-300 grid h-32 w-32 place-items-center">content</div>
          """
        ]
      },
      %Variation{
        id: :indicator_middle_end,
        slots: [
          """
          <:badge color="secondary" direction="middle" align="end"></:badge>
          <div class="bg-base-300 grid h-32 w-32 place-items-center">content</div>
          """
        ]
      },
      %Variation{
        id: :indicator_start_bottom,
        slots: [
          """
          <:badge color="secondary" direction="bottom" align="start"></:badge>
          <div class="bg-base-300 grid h-32 w-32 place-items-center">content</div>
          """
        ]
      },
      %Variation{
        id: :indicator_bottom_center,
        slots: [
          """
          <:badge color="secondary" direction="bottom" align="center"></:badge>
          <div class="bg-base-300 grid h-32 w-32 place-items-center">content</div>
          """
        ]
      },
      %Variation{
        id: :indicator_bottom_end,
        slots: [
          """
          <:badge color="secondary" direction="bottom" align="end"></:badge>
          <div class="bg-base-300 grid h-32 w-32 place-items-center">content</div>
          """
        ]
      },
      %Variation{
        id: :multiple_indicator,
        slots: [
          """
          <:badge color="secondary" direction="top" align="start"></:badge>
          <:badge color="secondary" direction="bottom" align="start"></:badge>
          <:badge color="secondary" direction="middle" align="start"></:badge>
          <:badge color="secondary" direction="top" align="end"></:badge>
          <:badge color="secondary" direction="bottom" align="end"></:badge>
          <:badge color="secondary" direction="middle" align="end"></:badge>
          <:badge color="secondary" direction="top" align="center"></:badge>
          <:badge color="secondary" direction="bottom" align="center"></:badge>
          <:badge color="secondary" direction="middle" align="center"></:badge>
          <div class="bg-base-300 grid h-32 w-32 place-items-center">content</div>
          """
        ]
      }
    ]
  end
end
