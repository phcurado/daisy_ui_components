defmodule Storybook.Components.Sidebar do
  use PhoenixStorybook.Story, :component

  alias DaisyUIComponents.Sidebar

  def function, do: &Sidebar.sidebar/1

  # def imports, do: [{Menu, menu: 1}]

  def variations do
    [
      %Variation{
        id: :drawer,
        attributes: %{
          class: "z-10",
          selector_id: "my-drawer",
        },
        slots: [
          """
          <:content class="p-4">
            hello
          </:content>
          <:item icon="hero-home" navigate={"/"} section="Main" label="home">Home</:item>
          <:item icon="hero-user" navigate={"/profile"} section="Main" label="home">Profile</:item>
          <:item icon="hero-gear" navigate={"/settings/general"} section="Settings" label="home">General</:item>
          <:item icon="hero-lock-closed" navigate={"/settings/security"} section="Settings" label="home">Security</:item>
          """
        ]
      },
    ]
  end
end
