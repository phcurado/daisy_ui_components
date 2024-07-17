defmodule Storybook.CoreComponents.Flash do
  use PhoenixStorybook.Story, :component

  alias DaisyUIComponents.Alert
  alias DaisyUIComponents.Button
  alias DaisyUIComponents.Utils

  def function, do: &Alert.flash/1
  def imports, do: [{Button, [button: 1]}, {Utils, [show: 1]}]

  def template do
    """
    <.button phx-click={show("#:variation_id")} psb-code-hidden>
      Open flash
    </.button>
    <.psb-variation/>
    """
  end

  def variations do
    [
      %Variation{
        id: :info_no_title,
        attributes: %{
          kind: :info,
          class: "hidden"
        },
        slots: ["Info message"]
      },
      %Variation{
        id: :error_with_title,
        attributes: %{
          kind: :error,
          class: "hidden",
          title: "Flash title"
        },
        slots: ["Error message"]
      }
    ]
  end
end
