defmodule Storybook.Components.Stat do
  use PhoenixStorybook.Story, :component

  alias DaisyUIComponents.Avatar
  alias DaisyUIComponents.Icon
  alias DaisyUIComponents.Stat

  def function, do: &Stat.stats/1

  def imports,
    do: [
      {Avatar, avatar: 1},
      {Icon, icon: 1},
      {Stat, [stat: 1, stat_figure: 1, stat_title: 1, stat_value: 1, stat_desc: 1]}
    ]

  def variations do
    [
      %Variation{
        id: :stat,
        attributes: %{
          class: "shadow"
        },
        slots: [
          """
          <.stat>
            <:title>Total Page Views</:title>
            <:value>89,400</:value>
            <:desc>21% more than last month</:desc>
          </.stat>
          """
        ]
      },
      %Variation{
        id: :stat_with_icon_and_image,
        attributes: %{
          class: "shadow"
        },
        slots: [
          """
          <.stat>
            <:figure class="text-primary"><.icon name="hero-heart" /></:figure>
            <:title>Downloads</:title>
            <:value class="text-primary">31K</:value>
            <:desc>Jan 1st - Feb 1st</:desc>
          </.stat>
          <.stat>
            <:figure class="text-secondary"><.icon name="hero-camera" /></:figure>
            <:title>Page Views</:title>
            <:value class="text-secondary">2.6M</:value>
            <:desc>21% more than last month</:desc>
          </.stat>
          <.stat>
            <.stat_figure class="text-secondary">
              <.avatar online>
                <div class="w-16 rounded-full">
                  <img src="https://img.daisyui.com/images/stock/photo-1534528741775-53994a69daeb.webp" />
                </div>
              </.avatar>
            </.stat_figure>
            <.stat_value>86%</.stat_value>
            <.stat_title>Tasks done</.stat_title>
            <.stat_desc class="text-secondary">31 tasks remaining</.stat_desc>
          </.stat>
          """
        ]
      },
      %VariationGroup{
        id: :centered_items_and_direction,
        variations:
          for direction <- Stat.directions() do
            %Variation{
              id: String.to_atom(direction),
              attributes: %{
                class: "shadow",
                direction: direction
              },
              slots: [
                """
                <.stat class="place-items-center">
                  <:title>Downloads</:title>
                  <:value>31K</:value>
                  <:desc>Jan 1st - Feb 1st</:desc>
                </.stat>
                <.stat class="place-items-center">
                  <:title>Users</:title>
                  <:value class="text-secondary">4,200</:value>
                  <:desc class="text-primary">↗︎ 40 (2%)</:desc>
                </.stat>
                <.stat class="place-items-center">
                  <:title>New Registers</:title>
                  <:value>1,200</:value>
                  <:desc>↘︎ 90 (14%)</:desc>
                </.stat>
                """
              ]
            }
          end
      }
    ]
  end
end
