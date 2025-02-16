defmodule Storybook.Components.Tooltip do
  use PhoenixStorybook.Story, :component

  alias DaisyUIComponents.Button
  alias DaisyUIComponents.Tooltip
  alias DaisyUIComponents.Utils

  def function, do: &Tooltip.tooltip/1

  def imports, do: [{Button, button: 1}]

  def variations do
    [
      %Variation{
        id: :tooltip,
        attributes: %{
          text: "hello"
        },
        slots: [
          """
          <.button>Hover me</.button>
          """
        ]
      },
      %Variation{
        id: :tooltip_force_open,
        attributes: %{
          text: "hello",
          open: true
        },
        slots: [
          """
          <.button>Force open</.button>
          """
        ]
      },
      %VariationGroup{
        id: :directions,
        variations:
          for direction <- Utils.directions() do
            %Variation{
              id: String.to_atom(direction),
              attributes: %{
                text: direction,
                direction: direction
              },
              slots: [
                """
                <.button>Hover me</.button>
                """
              ]
            }
          end
      },
      %VariationGroup{
        id: :colors,
        variations:
          for color <- Utils.colors() do
            %Variation{
              id: String.to_atom(color),
              attributes: %{
                text: color,
                color: color
              },
              slots: [
                """
                <.button>Hover me</.button>
                """
              ]
            }
          end
      }
      # %Variation{
      #   id: :tooltip_top,
      #   attributes: %{
      #     direction: "top"
      #   },
      #   slots: [
      #     """
      #     <div tabindex="0" class="btn m-1">Click</div>
      #     """,
      #     """
      #     <.menu tabindex="0" class="tooltip-content bg-base-100 rounded-box z-[1] w-52 p-2 shadow">
      #       <:item><a>Item 1</a></:item>
      #       <:item><a>Item 2</a></:item>
      #     </.menu>
      #     """
      #   ]
      # },
      # %Variation{
      #   id: :tooltip_top_aligns_to_end,
      #   attributes: %{
      #     align: "end",
      #     direction: "top"
      #   },
      #   slots: [
      #     """
      #     <div tabindex="0" class="btn m-1">Click</div>
      #     """,
      #     """
      #     <.menu tabindex="0" class="tooltip-content bg-base-100 rounded-box z-[1] w-52 p-2 shadow">
      #       <:item><a>Item 1</a></:item>
      #       <:item><a>Item 2</a></:item>
      #     </.menu>
      #     """
      #   ]
      # },
      # %Variation{
      #   id: :tooltip_bottom,
      #   attributes: %{
      #     direction: "bottom"
      #   },
      #   slots: [
      #     """
      #     <div tabindex="0" class="btn m-1">Click</div>
      #     """,
      #     """
      #     <.menu tabindex="0" class="tooltip-content bg-base-100 rounded-box z-[1] w-52 p-2 shadow">
      #       <:item><a>Item 1</a></:item>
      #       <:item><a>Item 2</a></:item>
      #     </.menu>
      #     """
      #   ]
      # },
      # %Variation{
      #   id: :tooltip_bottom_aligns_to_end,
      #   attributes: %{
      #     direction: "bottom",
      #     align: "end"
      #   },
      #   slots: [
      #     """
      #     <div tabindex="0" class="btn m-1">Click</div>
      #     """,
      #     """
      #     <.menu tabindex="0" class="tooltip-content bg-base-100 rounded-box z-[1] w-52 p-2 shadow">
      #       <:item><a>Item 1</a></:item>
      #       <:item><a>Item 2</a></:item>
      #     </.menu>
      #     """
      #   ]
      # },
      # %Variation{
      #   id: :tooltip_left,
      #   attributes: %{
      #     direction: "left"
      #   },
      #   slots: [
      #     """
      #     <div tabindex="0" class="btn m-1">Click</div>
      #     """,
      #     """
      #     <.menu tabindex="0" class="tooltip-content bg-base-100 rounded-box z-[1] w-52 p-2 shadow">
      #       <:item><a>Item 1</a></:item>
      #       <:item><a>Item 2</a></:item>
      #     </.menu>
      #     """
      #   ]
      # },
      # %Variation{
      #   id: :tooltip_left_aligns_to_end,
      #   attributes: %{
      #     direction: "left",
      #     align: "end"
      #   },
      #   slots: [
      #     """
      #     <div tabindex="0" class="btn m-1">Click</div>
      #     """,
      #     """
      #     <.menu tabindex="0" class="tooltip-content bg-base-100 rounded-box z-[1] w-52 p-2 shadow">
      #       <:item><a>Item 1</a></:item>
      #       <:item><a>Item 2</a></:item>
      #     </.menu>
      #     """
      #   ]
      # },
      # %Variation{
      #   id: :tooltip_right,
      #   attributes: %{
      #     direction: "right"
      #   },
      #   slots: [
      #     """
      #     <div tabindex="0" class="btn m-1">Click</div>
      #     """,
      #     """
      #     <.menu tabindex="0" class="tooltip-content bg-base-100 rounded-box z-[1] w-52 p-2 shadow">
      #       <:item><a>Item 1</a></:item>
      #       <:item><a>Item 2</a></:item>
      #     </.menu>
      #     """
      #   ]
      # },
      # %Variation{
      #   id: :tooltip_right_aligns_to_end,
      #   attributes: %{
      #     direction: "right",
      #     align: "end"
      #   },
      #   slots: [
      #     """
      #     <div tabindex="0" class="btn m-1">Click</div>
      #     """,
      #     """
      #     <.menu tabindex="0" class="tooltip-content bg-base-100 rounded-box z-[1] w-52 p-2 shadow">
      #       <:item><a>Item 1</a></:item>
      #       <:item><a>Item 2</a></:item>
      #     </.menu>
      #     """
      #   ]
      # },
      # %Variation{
      #   id: :tooltip_hover,
      #   attributes: %{
      #     hover: true
      #   },
      #   slots: [
      #     """
      #     <div tabindex="0" class="btn m-1">Click</div>
      #     """,
      #     """
      #     <.menu tabindex="0" class="tooltip-content bg-base-100 rounded-box z-[1] w-52 p-2 shadow">
      #       <:item><a>Item 1</a></:item>
      #       <:item><a>Item 2</a></:item>
      #     </.menu>
      #     """
      #   ]
      # },
      # %Variation{
      #   id: :tooltip_force_open,
      #   attributes: %{
      #     open: true
      #   },
      #   slots: [
      #     """
      #     <div tabindex="0" class="btn m-1">Click</div>
      #     """,
      #     """
      #     <.menu tabindex="0" class="tooltip-content bg-base-100 rounded-box z-[1] w-52 p-2 shadow">
      #       <:item><a>Item 1</a></:item>
      #       <:item><a>Item 2</a></:item>
      #     </.menu>
      #     """
      #   ]
      # },
      # %Variation{
      #   id: :cards_as_tooltip,
      #   slots: [
      #     """
      #     <div tabindex="0" role="button" class="btn m-1">Click</div>
      #     """,
      #     """
      #     <.card tabindex="0" padding="compact" class="tooltip-content bg-primary text-primary-content z-[1] w-64 p-2 shadow">
      #       <:card_title>
      #         Card title!
      #       </:card_title>
      #       <:card_body>
      #         <p>you can use any element as a tooltip.</p>
      #       </:card_body>
      #     </.card>
      #     """
      #   ]
      # }
    ]
  end
end
