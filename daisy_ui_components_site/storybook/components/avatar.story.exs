defmodule Storybook.Components.Avatar do
  use PhoenixStorybook.Story, :component

  alias DaisyUIComponents.Avatar

  def function, do: &Avatar.avatar/1

  def imports, do: [{Avatar, [avatar_group: 1]}]

  def variations do
    [
      %Variation{
        id: :avatar,
        slots: [
          """
          <div class="w-24 rounded">
            <img src="https://img.daisyui.com/images/stock/photo-1534528741775-53994a69daeb.webp" />
          </div>
          """
        ]
      },
      %VariationGroup{
        id: :avatar_in_custom_sizes,
        variations:
          for size <- ["w-32", "w-20", "w-16", "w-8"] do
            %Variation{
              id: String.to_atom(size),
              slots: [
                """
                <div class="#{size} rounded">
                  <img src="https://img.daisyui.com/images/stock/photo-1534528741775-53994a69daeb.webp" />
                </div>
                """
              ]
            }
          end
      },
      %Variation{
        id: :avatar_rounded,
        slots: [
          """
          <div class="w-24 rounded-full">
            <img src="https://img.daisyui.com/images/stock/photo-1534528741775-53994a69daeb.webp" />
          </div>
          """
        ]
      },
      %VariationGroup{
        id: :avatar_with_mask,
        variations:
          for mask <- ["mask-squircle", "mask-hexagon", "mask-triangle"] do
            %Variation{
              id: String.to_atom(mask),
              slots: [
                """
                <div class="mask #{mask} w-24">
                  <img src="https://img.daisyui.com/images/stock/photo-1534528741775-53994a69daeb.webp" />
                </div>
                """
              ]
            }
          end
      },
      %VariationGroup{
        id: :avatar_group,
        template: """
        <.avatar_group class="-space-x-6 rtl:space-x-reverse">
          <.psb-variation-group/>
        </.avatar_group>
        """,
        variations:
          for num <- 1..4 do
            %Variation{
              id: String.to_atom("#{num}"),
              slots: [
                """
                <div class="w-12">
                  <img src="https://img.daisyui.com/images/stock/photo-1534528741775-53994a69daeb.webp" />
                </div>
                """
              ]
            }
          end
      },
      %VariationGroup{
        id: :avatar_group_with_counter,
        template: """
        <.avatar_group class="-space-x-6 rtl:space-x-reverse">
          <.psb-variation-group/>
        </.avatar_group>
        """,
        variations:
          for num <- 1..3 do
            %Variation{
              id: String.to_atom("#{num}"),
              slots: [
                """
                <div class="w-12">
                  <img src="https://img.daisyui.com/images/stock/photo-1534528741775-53994a69daeb.webp" />
                </div>
                """
              ]
            }
          end ++
            [
              %Variation{
                id: :counter,
                attributes: %{
                  placeholder: true
                },
                slots: [
                  """
                  <div class="bg-neutral text-neutral-content w-12">
                    <span>+99</span>
                  </div>
                  """
                ]
              }
            ]
      },
      %Variation{
        id: :avatar_with_ring,
        slots: [
          """
          <div class="ring-primary ring-offset-base-100 w-24 rounded-full ring ring-offset-2">
            <img src="https://img.daisyui.com/images/stock/photo-1534528741775-53994a69daeb.webp" />
          </div>
          """
        ]
      },
      %VariationGroup{
        id: :avatar_with_presence_indicator,
        variations: [
          %Variation{
            id: :online,
            attributes: %{
              online: true
            },
            slots: [
              """
              <div class="w-24 rounded-full">
                <img src="https://img.daisyui.com/images/stock/photo-1534528741775-53994a69daeb.webp" />
              </div>
              """
            ]
          },
          %Variation{
            id: :offline,
            attributes: %{
              offline: true
            },
            slots: [
              """
              <div class="w-24 rounded-full">
                <img src="https://img.daisyui.com/images/stock/photo-1534528741775-53994a69daeb.webp" />
              </div>
              """
            ]
          }
        ]
      },
      %VariationGroup{
        id: :avatar_placeholder,
        variations: [
          %Variation{
            id: :plc1,
            attributes: %{
              placeholder: true
            },
            slots: [
              """
              <div class="bg-neutral text-neutral-content w-24 rounded-full">
                <span class="text-3xl">D</span>
              </div>
              """
            ]
          },
          %Variation{
            id: :plc2,
            attributes: %{
              online: true,
              placeholder: true
            },
            slots: [
              """
              <div class="bg-neutral text-neutral-content w-16 rounded-full">
                <span class="text-xl">AI</span>
              </div>
              """
            ]
          },
          %Variation{
            id: :plc3,
            attributes: %{
              placeholder: true
            },
            slots: [
              """
              <div class="bg-neutral text-neutral-content w-12 rounded-full">
                <span>SY</span>
              </div>
              """
            ]
          },
          %Variation{
            id: :plc4,
            attributes: %{
              placeholder: true
            },
            slots: [
              """
              <div class="bg-neutral text-neutral-content w-8 rounded-full">
                <span class="text-xs">UI</span>
              </div>
              """
            ]
          }
        ]
      }
    ]
  end
end
