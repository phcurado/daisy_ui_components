defmodule Storybook.Components.Dropdown do
  use PhoenixStorybook.Story, :component

  alias DaisyUIComponents.Card
  alias DaisyUIComponents.Dropdown
  alias DaisyUIComponents.Menu

  def function, do: &Dropdown.dropdown/1

  def imports, do: [{Menu, menu: 1}, {Card, card: 1}]

  def variations do
    [
      %Variation{
        id: :dropdown_menu_using_details,
        slots: [
          """
          <div tabindex="0" class="btn m-1">open or close</div>
          """,
          """
          <.menu tabindex="0" class="dropdown-content bg-base-100 rounded-box z-[1] w-52 p-2 shadow">
            <:item><a>Item 1</a></:item>
            <:item><a>Item 2</a></:item>
          </.menu>
          """
        ]
      },
      %Variation{
        id: :dropdown_aligns_to_end,
        attributes: %{
          align: "end"
        },
        slots: [
          """
          <div tabindex="0" class="btn m-1">Click</div>
          """,
          """
          <.menu tabindex="0" class="dropdown-content bg-base-100 rounded-box z-[1] w-52 p-2 shadow">
            <:item><a>Item 1</a></:item>
            <:item><a>Item 2</a></:item>
          </.menu>
          """
        ]
      },
      %Variation{
        id: :dropdown_top,
        attributes: %{
          direction: "top"
        },
        slots: [
          """
          <div tabindex="0" class="btn m-1">Click</div>
          """,
          """
          <.menu tabindex="0" class="dropdown-content bg-base-100 rounded-box z-[1] w-52 p-2 shadow">
            <:item><a>Item 1</a></:item>
            <:item><a>Item 2</a></:item>
          </.menu>
          """
        ]
      },
      %Variation{
        id: :dropdown_top_aligns_to_end,
        attributes: %{
          align: "end",
          direction: "top"
        },
        slots: [
          """
          <div tabindex="0" class="btn m-1">Click</div>
          """,
          """
          <.menu tabindex="0" class="dropdown-content bg-base-100 rounded-box z-[1] w-52 p-2 shadow">
            <:item><a>Item 1</a></:item>
            <:item><a>Item 2</a></:item>
          </.menu>
          """
        ]
      },
      %Variation{
        id: :dropdown_bottom,
        attributes: %{
          direction: "bottom"
        },
        slots: [
          """
          <div tabindex="0" class="btn m-1">Click</div>
          """,
          """
          <.menu tabindex="0" class="dropdown-content bg-base-100 rounded-box z-[1] w-52 p-2 shadow">
            <:item><a>Item 1</a></:item>
            <:item><a>Item 2</a></:item>
          </.menu>
          """
        ]
      },
      %Variation{
        id: :dropdown_bottom_aligns_to_end,
        attributes: %{
          direction: "bottom",
          align: "end"
        },
        slots: [
          """
          <div tabindex="0" class="btn m-1">Click</div>
          """,
          """
          <.menu tabindex="0" class="dropdown-content bg-base-100 rounded-box z-[1] w-52 p-2 shadow">
            <:item><a>Item 1</a></:item>
            <:item><a>Item 2</a></:item>
          </.menu>
          """
        ]
      },
      %Variation{
        id: :dropdown_left,
        attributes: %{
          direction: "left"
        },
        slots: [
          """
          <div tabindex="0" class="btn m-1">Click</div>
          """,
          """
          <.menu tabindex="0" class="dropdown-content bg-base-100 rounded-box z-[1] w-52 p-2 shadow">
            <:item><a>Item 1</a></:item>
            <:item><a>Item 2</a></:item>
          </.menu>
          """
        ]
      },
      %Variation{
        id: :dropdown_left_aligns_to_end,
        attributes: %{
          direction: "left",
          align: "end"
        },
        slots: [
          """
          <div tabindex="0" class="btn m-1">Click</div>
          """,
          """
          <.menu tabindex="0" class="dropdown-content bg-base-100 rounded-box z-[1] w-52 p-2 shadow">
            <:item><a>Item 1</a></:item>
            <:item><a>Item 2</a></:item>
          </.menu>
          """
        ]
      },
      %Variation{
        id: :dropdown_right,
        attributes: %{
          direction: "right"
        },
        slots: [
          """
          <div tabindex="0" class="btn m-1">Click</div>
          """,
          """
          <.menu tabindex="0" class="dropdown-content bg-base-100 rounded-box z-[1] w-52 p-2 shadow">
            <:item><a>Item 1</a></:item>
            <:item><a>Item 2</a></:item>
          </.menu>
          """
        ]
      },
      %Variation{
        id: :dropdown_right_aligns_to_end,
        attributes: %{
          direction: "right",
          align: "end"
        },
        slots: [
          """
          <div tabindex="0" class="btn m-1">Click</div>
          """,
          """
          <.menu tabindex="0" class="dropdown-content bg-base-100 rounded-box z-[1] w-52 p-2 shadow">
            <:item><a>Item 1</a></:item>
            <:item><a>Item 2</a></:item>
          </.menu>
          """
        ]
      },
      %Variation{
        id: :dropdown_hover,
        attributes: %{
          hover: true
        },
        slots: [
          """
          <div tabindex="0" class="btn m-1">Click</div>
          """,
          """
          <.menu tabindex="0" class="dropdown-content bg-base-100 rounded-box z-[1] w-52 p-2 shadow">
            <:item><a>Item 1</a></:item>
            <:item><a>Item 2</a></:item>
          </.menu>
          """
        ]
      },
      %Variation{
        id: :dropdown_force_open,
        attributes: %{
          open: true
        },
        slots: [
          """
          <div tabindex="0" class="btn m-1">Click</div>
          """,
          """
          <.menu tabindex="0" class="dropdown-content bg-base-100 rounded-box z-[1] w-52 p-2 shadow">
            <:item><a>Item 1</a></:item>
            <:item><a>Item 2</a></:item>
          </.menu>
          """
        ]
      },
      %Variation{
        id: :cards_as_dropdown,
        slots: [
          """
          <div tabindex="0" role="button" class="btn m-1">Click</div>
          """,
          """
          <.card tabindex="0" padding="compact" class="dropdown-content bg-primary text-primary-content z-[1] w-64 p-2 shadow">
            <:card_title>
              Card title!
            </:card_title>
            <:card_body>
              <p>you can use any element as a dropdown.</p>
            </:card_body>
          </.card>
          """
        ]
      }
    ]
  end
end
