defmodule Storybook.Components.Navbar do
  use PhoenixStorybook.Story, :component

  alias DaisyUIComponents.Button
  alias DaisyUIComponents.Badge
  alias DaisyUIComponents.Card
  alias DaisyUIComponents.Dropdown
  alias DaisyUIComponents.Icon
  alias DaisyUIComponents.Input
  alias DaisyUIComponents.Menu
  alias DaisyUIComponents.Navbar

  def function, do: &Navbar.navbar/1

  def imports,
    do: [
      {Badge, [badge: 1]},
      {Button, [button: 1]},
      {Card, [card: 1, card_body: 1, card_actions: 1]},
      {Dropdown, [dropdown: 1]},
      {Icon, [icon: 1]},
      {Input, [input: 1]},
      {Menu, menu: 1}
    ]

  def variations do
    [
      %Variation{
        id: :navbar_with_title,
        attributes: %{
          class: "bg-base-100 shadow-xl rounded-box"
        },
        slots: [
          """
          <a class="btn btn-ghost text-xl">daisyUI</a>
          """
        ]
      },
      %Variation{
        id: :navbar_with_title_and_icon,
        attributes: %{
          class: "bg-base-100 shadow-xl rounded-box"
        },
        slots: [
          """
          <div class="flex-1">
            <a class="btn btn-ghost text-xl">daisyUI</a>
          </div>
          <div class="flex-none">
            <.button square ghost>
              <.icon name="hero-ellipsis-horizontal" />
            </.button>
          </div>
          """
        ]
      },
      %Variation{
        id: :navbar_with_icon_at_start_and_end,
        attributes: %{
          class: "bg-base-100 shadow-xl rounded-box"
        },
        slots: [
          """
          <div class="flex-none">
            <.button square ghost>
              <.icon name="hero-bars-3" />
            </.button>
          </div>
          <div class="flex-1">
            <a class="btn btn-ghost text-xl">daisyUI</a>
          </div>
          <div class="flex-none">
            <.button square ghost>
              <.icon name="hero-ellipsis-horizontal" />
            </.button>
          </div>
          """
        ]
      },
      %Variation{
        id: :navbar_with_menu_and_submenu,
        attributes: %{
          class: "bg-base-100 shadow-xl rounded-box"
        },
        slots: [
          """
          <div class="flex-1">
            <a class="btn btn-ghost text-xl">daisyUI</a>
          </div>
          <div class="flex-none">
            <.menu direction="horizontal" class="px-1">
              <:item><a>link</a></:item>
              <:item>
                <details>
                  <summary>parent</summary>
                  <ul class="bg-base-100 rounded-t-none p-2">
                    <li><a>link 1</a></li>
                    <li><a>link 2</a></li>
                  </ul>
                </details>
              </:item>
            </.menu>
          </div>
          """
        ]
      },
      %Variation{
        id: :navbar_with_search_input_and_dropdown,
        attributes: %{
          class: "bg-base-100 shadow-xl rounded-box"
        },
        slots: [
          """
          <div class="flex-1">
            <a class="btn btn-ghost text-xl">daisyUI</a>
          </div>
          <div class="flex-none gap-2">
            <div class="form-control">
              <.input type="text" placeholder="Search" bordered class="w-24 md:w-auto" />
            </div>
            <.dropdown align_end>
              <div tabindex="0" role="button" class="btn btn-ghost btn-circle avatar">
                <div class="w-10 rounded-full">
                  <img
                    alt="Tailwind CSS Navbar component"
                    src="https://img.daisyui.com/images/stock/photo-1534528741775-53994a69daeb.webp" />
                </div>
              </div>
              <.menu tabindex="0" size="sm" class="dropdown-content bg-base-100 rounded-box z-[1] mt-3 w-52 p-2 shadow">
                <:item>
                  <a class="justify-between">
                    Profile
                    <.badge>New</.badge>
                  </a>
                </:item>
                <:item><a>Settings</a></:item>
                <:item><a>Logout</a></:item>
              </.menu>
            </.dropdown>
          </div>
          """
        ]
      },
      %Variation{
        id: :navbar_with_icon_indicator_and_dropdown,
        attributes: %{
          class: "bg-base-100 shadow-xl rounded-box"
        },
        slots: [
          """
          <div class="flex-1">
            <a class="btn btn-ghost text-xl">daisyUI</a>
          </div>
          <div class="flex-none">
            <.dropdown align_end>
              <div tabindex="0" role="button" class="btn btn-ghost btn-circle">
                <div class="indicator">
                  <.icon name="hero-shopping-cart" />
                  <.badge size="sm" class="indicator-item">8</.badge>
                </div>
              </div>
              <.card padding="compact" class="dropdown-content bg-base-100 z-[1] mt-3 w-52 shadow">
                <:card_body>
                  <span class="text-lg font-bold">8 Items</span>
                  <span class="text-info">Subtotal: $999</span>
                </:card_body>
                <:card_actions>
                  <.button color="primary" block>View cart</.button>
                </:card_actions>
              </.card>
            </.dropdown>
            <.dropdown align_end>
              <div tabindex="0" role="button" class="btn btn-ghost btn-circle avatar">
                <div class="w-10 rounded-full">
                  <img
                    alt="Tailwind CSS Navbar component"
                    src="https://img.daisyui.com/images/stock/photo-1534528741775-53994a69daeb.webp" />
                </div>
              </div>
              <.menu tabindex="0" size="sm" class="dropdown-content bg-base-100 rounded-box z-[1] mt-3 w-52 p-2 shadow">
                <:item>
                  <a class="justify-between">
                    Profile
                    <.badge>New</.badge>
                  </a>
                </:item>
                <:item><a>Settings</a></:item>
                <:item><a>Logout</a></:item>
              </.menu>
            </.dropdown>
          </div>
          """
        ]
      },
      %Variation{
        id: :navbar_with_dropdown_center_logo_and_icon,
        attributes: %{
          class: "bg-base-100 shadow-xl rounded-box"
        },
        slots: [
          """
          <:navbar_start>
            <.dropdown>
              <div tabindex="0" role="button" class="btn btn-ghost btn-circle">
                <.icon name="hero-bars-3-bottom-right" />
              </div>
              <.menu tabindex="0" size="sm" class="dropdown-content bg-base-100 rounded-box z-[1] mt-3 w-52 p-2 shadow">
                <:item><a>Homepage</a></:item>
                <:item><a>Portfolio</a></:item>
                <:item><a>About</a></:item>
              </.menu>
            </.dropdown>
          </:navbar_start>
          <:navbar_center>
            <a class="btn btn-ghost text-xl">daisyUI</a>
          </:navbar_center>
          <:navbar_end>
            <.button shape="circle" ghost>
              <.icon name="hero-magnifying-glass" />
            </.button>
            <.button shape="circle" ghost>
              <div class="indicator">
                <.icon name="hero-bell" />
                <.badge size="xs" color="primary" class="indicator-item"></.badge>
              </div>
            </.button>
          </:navbar_end>
          """
        ]
      },
      %Variation{
        id: :navbar_responsive,
        attributes: %{
          class: "bg-base-100 shadow-xl rounded-box"
        },
        slots: [
          """
          <:navbar_start>
            <.dropdown>
              <div tabindex="0" role="button" class="btn btn-ghost lg:hidden">
                <.icon name="hero-bars-3-bottom-right" />
              </div>
              <.menu tabindex="0" size="sm" class="dropdown-content bg-base-100 rounded-box z-[1] mt-3 w-52 p-2 shadow">
                <:item><a>Item 1</a></:item>
                <:item>
                  <a>Parent</a>
                  <ul class="p-2">
                    <li><a>Submenu 1</a></li>
                    <li><a>Submenu 2</a></li>
                  </ul>
                </:item>
                <:item><a>Item 3</a></:item>
              </.menu>
            </.dropdown>
            <a class="btn btn-ghost text-xl">daisyUI</a>
          </:navbar_start>
          <:navbar_center class="hidden lg:flex">
            <.menu direction="horizontal" class="px-1">
              <:item><a>Item 1</a></:item>
              <:item>
                <details>
                  <summary>Parent</summary>
                  <ul class="p-2 bg-base-100 w-40">
                    <li><a>Submenu 1</a></li>
                    <li><a>Submenu 2</a></li>
                  </ul>
                </details>
              </:item>
              <:item><a>Item 3</a></:item>
            </.menu>
          </:navbar_center>
          <:navbar_end>
            <a class="btn">Button</a>
          </:navbar_end>
          """
        ]
      },
      %VariationGroup{
        id: :navbar_with_colors,
        variations:
          for class <- [
                "bg-neutral text-neutral-content",
                "bg-base-300",
                "bg-primary text-primary-content"
              ] do
            %Variation{
              id: String.to_atom(class),
              attributes: %{
                class: "shadow-xl rounded-box mb-2 " <> class
              },
              slots: [
                """
                <button class="btn btn-ghost text-xl">daisyUI</button>
                """
              ]
            }
          end
      }
    ]
  end
end
