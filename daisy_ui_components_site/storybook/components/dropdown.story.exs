defmodule Storybook.Components.Dropdown do
  use PhoenixStorybook.Story, :component

  alias DaisyUIComponents.Dropdown

  def function, do: &Dropdown.dropdown/1

  def variations do
    [
      %Variation{
        id: :dropdown_menu_using_details,
        slots: [
          """
          <div tabindex="0" class="btn m-1">open or close</div>
          """,
          """
          <ul tabindex="0" class="menu dropdown-content bg-base-100 rounded-box z-[1] w-52 p-2 shadow">
            <li><a>Item 1</a></li>
            <li><a>Item 2</a></li>
          </ul>
          """
        ]
      },
      %Variation{
        id: :dropdown_aligns_to_end,
        attributes: %{
          end: true
        },
        slots: [
          """
          <div tabindex="0" class="btn m-1">Click</div>
          """,
          """
          <ul tabindex="0" class="menu dropdown-content bg-base-100 rounded-box z-[1] w-52 p-2 shadow">
            <li><a>Item 1</a></li>
            <li><a>Item 2</a></li>
          </ul>
          """
        ]
      },
      %Variation{
        id: :dropdown_top,
        attributes: %{
          top: true
        },
        slots: [
          """
          <div tabindex="0" class="btn m-1">Click</div>
          """,
          """
          <ul tabindex="0" class="menu dropdown-content bg-base-100 rounded-box z-[1] w-52 p-2 shadow">
            <li><a>Item 1</a></li>
            <li><a>Item 2</a></li>
          </ul>
          """
        ]
      },
      %Variation{
        id: :dropdown_top_aligns_to_end,
        attributes: %{
          top: true,
          end: true
        },
        slots: [
          """
          <div tabindex="0" class="btn m-1">Click</div>
          """,
          """
          <ul tabindex="0" class="menu dropdown-content bg-base-100 rounded-box z-[1] w-52 p-2 shadow">
            <li><a>Item 1</a></li>
            <li><a>Item 2</a></li>
          </ul>
          """
        ]
      },
      %Variation{
        id: :dropdown_bottom,
        attributes: %{
          bottom: true
        },
        slots: [
          """
          <div tabindex="0" class="btn m-1">Click</div>
          """,
          """
          <ul tabindex="0" class="menu dropdown-content bg-base-100 rounded-box z-[1] w-52 p-2 shadow">
            <li><a>Item 1</a></li>
            <li><a>Item 2</a></li>
          </ul>
          """
        ]
      },
      %Variation{
        id: :dropdown_bottom_aligns_to_end,
        attributes: %{
          bottom: true,
          end: true
        },
        slots: [
          """
          <div tabindex="0" class="btn m-1">Click</div>
          """,
          """
          <ul tabindex="0" class="menu dropdown-content bg-base-100 rounded-box z-[1] w-52 p-2 shadow">
            <li><a>Item 1</a></li>
            <li><a>Item 2</a></li>
          </ul>
          """
        ]
      },
      %Variation{
        id: :dropdown_left,
        attributes: %{
          left: true
        },
        slots: [
          """
          <div tabindex="0" class="btn m-1">Click</div>
          """,
          """
          <ul tabindex="0" class="menu dropdown-content bg-base-100 rounded-box z-[1] w-52 p-2 shadow">
            <li><a>Item 1</a></li>
            <li><a>Item 2</a></li>
          </ul>
          """
        ]
      },
      %Variation{
        id: :dropdown_left_aligns_to_end,
        attributes: %{
          left: true,
          end: true
        },
        slots: [
          """
          <div tabindex="0" class="btn m-1">Click</div>
          """,
          """
          <ul tabindex="0" class="menu dropdown-content bg-base-100 rounded-box z-[1] w-52 p-2 shadow">
            <li><a>Item 1</a></li>
            <li><a>Item 2</a></li>
          </ul>
          """
        ]
      },
      %Variation{
        id: :dropdown_right,
        attributes: %{
          right: true
        },
        slots: [
          """
          <div tabindex="0" class="btn m-1">Click</div>
          """,
          """
          <ul tabindex="0" class="menu dropdown-content bg-base-100 rounded-box z-[1] w-52 p-2 shadow">
            <li><a>Item 1</a></li>
            <li><a>Item 2</a></li>
          </ul>
          """
        ]
      },
      %Variation{
        id: :dropdown_right_aligns_to_end,
        attributes: %{
          right: true,
          end: true
        },
        slots: [
          """
          <div tabindex="0" class="btn m-1">Click</div>
          """,
          """
          <ul tabindex="0" class="menu dropdown-content bg-base-100 rounded-box z-[1] w-52 p-2 shadow">
            <li><a>Item 1</a></li>
            <li><a>Item 2</a></li>
          </ul>
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
          <ul tabindex="0" class="menu dropdown-content bg-base-100 rounded-box z-[1] w-52 p-2 shadow">
            <li><a>Item 1</a></li>
            <li><a>Item 2</a></li>
          </ul>
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
          <ul tabindex="0" class="menu dropdown-content bg-base-100 rounded-box z-[1] w-52 p-2 shadow">
            <li><a>Item 1</a></li>
            <li><a>Item 2</a></li>
          </ul>
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
          <div
            tabindex="0"
            class="dropdown-content card card-compact bg-primary text-primary-content z-[1] w-64 p-2 shadow">
            <div class="card-body">
              <h3 class="card-title">Card title!</h3>
              <p>you can use any element as a dropdown.</p>
            </div>
          </div>
          """
        ]
      }
    ]
  end
end
