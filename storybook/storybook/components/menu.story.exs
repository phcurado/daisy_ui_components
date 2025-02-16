defmodule Storybook.Components.Meni do
  use PhoenixStorybook.Story, :component

  alias DaisyUIComponents.Icon
  alias DaisyUIComponents.Menu
  alias DaisyUIComponents.Utils

  def function, do: &Menu.menu/1

  def imports,
    do: [{Icon, icon: 1}]

  def variations do
    [
      %Variation{
        id: :menu,
        attributes: %{
          class: "bg-base-200 rounded-box w-56"
        },
        slots: [
          """
          <:item><a>Item 1</a></:item>
          <:item><a>Item 2</a></:item>
          <:item><a>Item 3</a></:item>
          """
        ]
      },
      %Variation{
        id: :menu_responsive,
        attributes: %{
          direction: "vertical",
          class: "lg:menu-horizontal bg-base-200 rounded-box"
        },
        slots: [
          """
          <:item><a>Item 1</a></:item>
          <:item><a>Item 2</a></:item>
          <:item><a>Item 3</a></:item>
          """
        ]
      },
      %VariationGroup{
        id: :menu_with_icon_only,
        variations:
          for direction <- Menu.directions() do
            %Variation{
              id: String.to_atom(direction),
              attributes: %{
                direction: direction,
                class: "bg-base-200 rounded-box"
              },
              slots: [
                """
                <:item><a><.icon name="hero-home" /></a></:item>
                <:item><a><.icon name="hero-exclamation-circle" /></a></:item>
                <:item><a><.icon name="hero-chart-bar" /></a></:item>
                """
              ]
            }
          end
      },
      %VariationGroup{
        id: :menu_with_icon_only_and_tooltip,
        variations:
          for direction <- Menu.directions() do
            %Variation{
              id: String.to_atom(direction),
              attributes: %{
                direction: direction,
                class: "bg-base-200 rounded-box"
              },
              slots: [
                """
                <:item><a class="tooltip" data-tip="Home"><.icon name="hero-home" /></a></:item>
                <:item><a class="tooltip" data-tip="Details"><.icon name="hero-exclamation-circle" /></a></:item>
                <:item><a class="tooltip" data-tip="Stats"><.icon name="hero-chart-bar" /></a></:item>
                """
              ]
            }
          end
      },
      %VariationGroup{
        id: :menu_sizes,
        variations:
          for size <- Utils.sizes() do
            %Variation{
              id: String.to_atom(size),
              attributes: %{
                size: size,
                class: "bg-base-200 rounded-box w-56"
              },
              slots: [
                """
                <:item><a>#{size} item 1</a></:item>
                <:item><a>#{size} item 2</a></:item>
                """
              ]
            }
          end
      },
      %Variation{
        id: :menu_with_disabled_items,
        attributes: %{
          class: "bg-base-200 rounded-box w-56"
        },
        slots: [
          """
          <:item><a>Enabled item</a></:item>
          <:item class="disabled"><a>disabled item</a></:item>
          <:item class="disabled"><a>disabled item</a></:item>
          """
        ]
      },
      %Variation{
        id: :menu_with_icon,
        attributes: %{
          class: "bg-base-200 rounded-box w-56"
        },
        slots: [
          """
          <:item><a><.icon name="hero-home" /> Item 1 </a></:item>
          <:item><a><.icon name="hero-exclamation-circle" /> Item 2 </a></:item>
          <:item><a><.icon name="hero-chart-bar" /> Item 3 </a></:item>
          """
        ]
      },
      %Variation{
        id: :menu_with_title,
        attributes: %{
          class: "bg-base-200 rounded-box w-56"
        },
        slots: [
          """
          <:item class="menu-title">Title</:item>
          <:item><a>Item 1</a></:item>
          <:item><a>Item 2</a></:item>
          <:item><a>Item 3</a></:item>
          """
        ]
      },
      %Variation{
        id: :menu_with_title_as_parent,
        attributes: %{
          class: "bg-base-200 rounded-box w-56"
        },
        slots: [
          """
          <:item>
            <h2 class="menu-title">Title</h2>
            <ul>
              <li><a>Item 1</a></li>
              <li><a>Item 2</a></li>
              <li><a>Item 3</a></li>
            </ul>
          </:item>
          """
        ]
      },
      %Variation{
        id: :submenu,
        attributes: %{
          class: "bg-base-200 rounded-box w-56"
        },
        slots: [
          """
          <:item><a>Item 1</a></:item>
          <:item>
            <ul>
              <li><a>Submenu 1</a></li>
              <li><a>Submenu 2</a></li>
              <li>
                <a>Parent</a>
                <ul>
                  <li><a>Submenu 1</a></li>
                  <li><a>Submenu 2</a></li>
                </ul>
              </li>
            </ul>
          </:item>
          <:item><a>Item 3</a></:item>
          """
        ]
      },
      %Variation{
        id: :collapse_submenu,
        attributes: %{
          class: "bg-base-200 rounded-box w-56"
        },
        slots: [
          """
          <:item><a>Item 1</a></:item>
          <:item>
            <details open>
              <summary>Parent</summary>
              <ul>
                <li><a>Submenu 1</a></li>
                <li><a>Submenu 2</a></li>
                <li>
                  <details open>
                    <summary>Parent</summary>
                    <ul>
                      <li><a>Submenu 1</a></li>
                      <li><a>Submenu 2</a></li>
                    </ul>
                  </details>
                </li>
              </ul>
            </details>
          </:item>
          <:item><a>Item 3</a></:item>
          """
        ]
      },
      %Variation{
        id: :menu_with_active_item,
        attributes: %{
          class: "bg-base-200 rounded-box w-56"
        },
        slots: [
          """
          <:item><a>Item 1</a></:item>
          <:item><a class="active">Item 2</a></:item>
          <:item><a>Item 3</a></:item>
          """
        ]
      },
      %Variation{
        id: :collapsible_with_submenu,
        attributes: %{
          class: "lg:menu-horizontal bg-base-200 rounded-box lg:mb-64"
        },
        slots: [
          """
          <:item><a>Item 1</a></:item>
          <:item>
            <details open>
              <summary>Parent item</summary>
              <ul>
                <li><a>Submenu 1</a></li>
                <li><a>Submenu 2</a></li>
                <li>
                  <details open>
                    <summary>Parent</summary>
                    <ul>
                      <li><a>item 1</a></li>
                      <li><a>item 2</a></li>
                    </ul>
                  </details>
                </li>
              </ul>
            </details>
          </:item>
          <:item><a>Item 3</a></:item>
          """
        ]
      }
    ]
  end
end
