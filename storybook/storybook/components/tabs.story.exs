defmodule Storybook.Components.Tabs do
  use PhoenixStorybook.Story, :component

  alias DaisyUIComponents.Icon
  alias DaisyUIComponents.Tabs
  alias DaisyUIComponents.Utils

  def function, do: &Tabs.tabs/1

  def imports,
    do: [
      {Tabs, [tab: 1, tab_content: 1]},
      {Icon, [icon: 1]}
    ]

  def variations do
    [
      %Variation{
        id: :tabs,
        slots: [
          """
          <.tab>Tab 1</.tab>
          <.tab active>Tab 2</.tab>
          <.tab disabled>Tab 3</.tab>
          """
        ]
      },
      %Variation{
        id: :tabs_border,
        attributes: %{
          border: true
        },
        slots: [
          """
          <.tab>Tab 1</.tab>
          <.tab active>Tab 2</.tab>
          <.tab disabled>Tab 3</.tab>
          """
        ]
      },
      %Variation{
        id: :tabs_lift,
        attributes: %{
          lift: true
        },
        slots: [
          """
          <.tab>Tab 1</.tab>
          <.tab active>Tab 2</.tab>
          <.tab disabled>Tab 3</.tab>
          """
        ]
      },
      %Variation{
        id: :tabs_box,
        attributes: %{
          box: true
        },
        slots: [
          """
          <.tab>Tab 1</.tab>
          <.tab active>Tab 2</.tab>
          <.tab disabled>Tab 3</.tab>
          """
        ]
      },
      %Variation{
        id: :tabs_box_using_radio_input,
        attributes: %{
          box: true
        },
        slots: [
          """
          <.tab type="radio" name="my_tabs_1" title="Tab 1" />
          <.tab type="radio" name="my_tabs_1" checked title="Tab 2" />
          <.tab type="radio" name="my_tabs_1" title="Tab 3" />
          """
        ]
      },
      %VariationGroup{
        id: :tabs_sizes,
        variations:
          for size <- Utils.sizes() do
            %Variation{
              id: String.to_atom(size),
              attributes: %{
                class: "mb-2",
                lift: true,
                size: size
              },
              slots: [
                """
                <.tab>Tab 1</.tab>
                <.tab active>Tab 2</.tab>
                <.tab disabled>Tab 3</.tab>
                """
              ]
            }
          end
      },
      %Variation{
        id: :tabs_border_with_content,
        attributes: %{
          border: true
        },
        slots: [
          """
          <.tab type="radio" name="my_tabs_2" title="Tab 1" />
          <.tab_content class="border-base-300 bg-base-100 p-10">
            Tab content 1
          </.tab_content>
          <.tab type="radio" name="my_tabs_2" checked title="Tab 2" />
          <.tab_content class="border-base-300 bg-base-100 p-10">
            Tab content 2
          </.tab_content>
          <.tab type="radio" name="my_tabs_2" title="Tab 3" />
          <.tab_content class="border-base-300 bg-base-100 p-10">
            Tab content 3
          </.tab_content>
          """
        ]
      },
      %Variation{
        id: :tabs_lift_with_icons_and_content,
        attributes: %{
          lift: true
        },
        slots: [
          """
          <.tab type="label" name="my_tabs_4">
            <.icon name="hero-play" />
            Live
          </.tab>
          <.tab_content class="border-base-300 bg-base-100 p-10">
            Tab content 1
          </.tab_content>
          <.tab type="label" name="my_tabs_4" active>
            <.icon name="hero-face-smile" />
            Laugh
          </.tab>
          <.tab_content class="border-base-300 bg-base-100 p-10">
            Tab content 2
          </.tab_content>
          <.tab type="label" name="my_tabs_4">
            <.icon name="hero-heart" />
            Love
          </.tab>
          <.tab_content class="border-base-300 bg-base-100 p-10">
            Tab content 3
          </.tab_content>
          """
        ]
      },
      %Variation{
        id: :tabs_border_with_content_on_bottom,
        attributes: %{
          lift: true,
          position: "bottom"
        },
        slots: [
          """
          <.tab type="radio" name="my_tabs_5" title="Tab 1" />
          <.tab_content class="border-base-300 bg-base-100 p-10">
            Tab content 1
          </.tab_content>
          <.tab type="radio" name="my_tabs_5" checked title="Tab 2" />
          <.tab_content class="border-base-300 bg-base-100 p-10">
            Tab content 2
          </.tab_content>
          <.tab type="radio" name="my_tabs_5" title="Tab 3" />
          <.tab_content class="border-base-300 bg-base-100 p-10">
            Tab content 3
          </.tab_content>
          """
        ]
      },
      %Variation{
        id: :tabs_with_custom_color,
        slots: [
          """
          <.tab>Tab 1</.tab>
          <.tab class="text-primary bg-orange-500" active>Tab 2</.tab>
          <.tab disabled>Tab 3</.tab>
          """
        ]
      }
    ]
  end
end
