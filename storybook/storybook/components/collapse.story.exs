defmodule Storybook.Components.Collapse do
  use PhoenixStorybook.Story, :component

  def function, do: &DaisyUIComponents.Collapse.collapse/1

  def variations do
    [
      %Variation{
        id: :basic_collapse,
        slots: [
          ~s(<:title>Click to open/close</:title>),
          "This is the content of the collapse"
        ]
      },
      %Variation{
        id: :collapse_with_checkbox,
        attributes: %{
          checkbox: true
        },
        slots: [
          ~s(<:title>Click to toggle</:title>),
          "Content that can be toggled by clicking the checkbox"
        ]
      },
      %Variation{
        id: :collapse_with_arrow,
        attributes: %{
          arrow: true
        },
        slots: [
          ~s(<:title>Collapse with arrow</:title>),
          "Arrow indicator shows the collapse state"
        ]
      },
      %Variation{
        id: :collapse_with_plus,
        attributes: %{
          plus: true
        },
        slots: [
          ~s(<:title>Collapse with plus/minus</:title>),
          "Plus and minus icons indicate the state"
        ]
      },
      %Variation{
        id: :collapse_open,
        attributes: %{
          open: true,
          arrow: true
        },
        slots: [
          ~s(<:title>Always open</:title>),
          "This collapse is forced open"
        ]
      },
      %Variation{
        id: :collapse_close,
        attributes: %{
          close: true,
          arrow: true
        },
        slots: [
          ~s(<:title>Always closed</:title>),
          "This collapse is forced closed"
        ]
      }
    ]
  end
end
