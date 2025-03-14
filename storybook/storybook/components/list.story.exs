defmodule Storybook.Components.List do
  use PhoenixStorybook.Story, :component

  alias DaisyUIComponents.Button
  alias DaisyUIComponents.Icon
  alias DaisyUIComponents.List

  def function, do: &List.list/1

  def imports,
    do: [
      {Button, button: 1},
      {Icon, icon: 1}
    ]

  def variations do
    [
      %Variation{
        id: :list,
        slots: [
          ~s|<:item title="Title">Elixir</:item>|,
          ~s|<:item title="Rating">5/5</:item>|
        ]
      },
      %Variation{
        id: :list_with_information,
        slots: [
          """
          <:header>Most played songs this week</:header>
          <:item>
            <div><img class="size-10 rounded-box" src="https://img.daisyui.com/images/profile/demo/1@94.webp"/></div>
            <div>
              <div>Dio Lupa</div>
              <div class="text-xs uppercase font-semibold opacity-60">Remaining Reason</div>
            </div>
            <p class="list-col-wrap text-xs">
              "Remaining Reason" became an instant hit, praised for its haunting sound and emotional depth. A viral performance brought it widespread recognition, making it one of Dio Lupa’s most iconic tracks.
            </p>
            <.button shape="square" ghost>
              <svg class="size-[1.2em]" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><g stroke-linejoin="round" stroke-linecap="round" stroke-width="2" fill="none" stroke="currentColor"><path d="M6 3L20 12 6 21 6 3z"></path></g></svg>
            </.button>
            <.button shape="square" ghost>
              <svg class="size-[1.2em]" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><g stroke-linejoin="round" stroke-linecap="round" stroke-width="2" fill="none" stroke="currentColor"><path d="M19 14c1.49-1.46 3-3.21 3-5.5A5.5 5.5 0 0 0 16.5 3c-1.76 0-3 .5-4.5 2-1.5-1.5-2.74-2-4.5-2A5.5 5.5 0 0 0 2 8.5c0 2.3 1.5 4.05 3 5.5l7 7Z"></path></g></svg>
            </.button>
          </:item>
          <:item>
            <div><img class="size-10 rounded-box" src="https://img.daisyui.com/images/profile/demo/4@94.webp"/></div>
            <div>
              <div>Ellie Beilish</div>
              <div class="text-xs uppercase font-semibold opacity-60">Bears of a fever</div>
            </div>
            <p class="list-col-wrap text-xs">
              "Bears of a Fever" captivated audiences with its intense energy and mysterious lyrics. Its popularity skyrocketed after fans shared it widely online, earning Ellie critical acclaim.
            </p>
            <.button shape="square" ghost>
              <svg class="size-[1.2em]" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><g stroke-linejoin="round" stroke-linecap="round" stroke-width="2" fill="none" stroke="currentColor"><path d="M6 3L20 12 6 21 6 3z"></path></g></svg>
            </.button>
            <.button shape="square" ghost>
              <svg class="size-[1.2em]" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><g stroke-linejoin="round" stroke-linecap="round" stroke-width="2" fill="none" stroke="currentColor"><path d="M19 14c1.49-1.46 3-3.21 3-5.5A5.5 5.5 0 0 0 16.5 3c-1.76 0-3 .5-4.5 2-1.5-1.5-2.74-2-4.5-2A5.5 5.5 0 0 0 2 8.5c0 2.3 1.5 4.05 3 5.5l7 7Z"></path></g></svg>
            </.button>
          </:item>
          <:item>
            <div><img class="size-10 rounded-box" src="https://img.daisyui.com/images/profile/demo/3@94.webp"/></div>
            <div>
              <div>Sabrino Gardener</div>
              <div class="text-xs uppercase font-semibold opacity-60">Cappuccino</div>
            </div>
            <p class="list-col-wrap text-xs">
              "Cappuccino" quickly gained attention for its smooth melody and relatable themes. The song’s success propelled Sabrino into the spotlight, solidifying their status as a rising star.
            </p>
            <.button shape="square" ghost>
              <svg class="size-[1.2em]" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><g stroke-linejoin="round" stroke-linecap="round" stroke-width="2" fill="none" stroke="currentColor"><path d="M6 3L20 12 6 21 6 3z"></path></g></svg>
            </.button>
            <.button shape="square" ghost>
              <svg class="size-[1.2em]" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><g stroke-linejoin="round" stroke-linecap="round" stroke-width="2" fill="none" stroke="currentColor"><path d="M19 14c1.49-1.46 3-3.21 3-5.5A5.5 5.5 0 0 0 16.5 3c-1.76 0-3 .5-4.5 2-1.5-1.5-2.74-2-4.5-2A5.5 5.5 0 0 0 2 8.5c0 2.3 1.5 4.05 3 5.5l7 7Z"></path></g></svg>
            </.button>
          </:item>
          """
        ]
      }
    ]
  end
end
