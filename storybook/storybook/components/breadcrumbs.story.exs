defmodule Storybook.Components.Breadcrumbs do
  use PhoenixStorybook.Story, :component

  alias DaisyUIComponents.Breadcrumbs

  def function, do: &Breadcrumbs.breadcrumbs/1

  def variations do
    [
      %Variation{
        id: :breadcrumbs,
        slots: [
          """
          <ul>
            <li><a>Home</a></li>
            <li><a>Documents</a></li>
            <li>Add Document</li>
          </ul>
          """
        ]
      },
      %Variation{
        id: :breadcrumbs_with_slots,
        slots: [
          """
          <:item path="#"> 
            home
          </:item>
          <:item path="#">
           Documents 
          </:item>
          <:item>
           Add Documents 
          </:item>
          """
        ]
      },
      %Variation{
        id: :breadcrumbs_with_icons,
        slots: [
          """
          <:item icon="hero-home" path="#">
            home
          </:item>
          <:item icon="hero-document" path="#">
           Documents 
          </:item>
          <:item icon="hero-document-plus">
           Add Documents 
          </:item>
          """
        ]
      }
    ]
  end
end
