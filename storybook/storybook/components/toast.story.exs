defmodule Storybook.Components.Toast do
  use PhoenixStorybook.Story, :component

  alias DaisyUIComponents.Alert

  def function, do: &DaisyUIComponents.Toast.toast/1

  def imports, do: [{Alert, alert: 1}]

  def template do
    """
    <div class="relative w-full h-64 bg-base-200 rounded-lg">
      <.psb-variation/>
    </div>
    """
  end

  def variations do
    [
      %Variation{
        id: :basic_toast,
        attributes: %{
          class: "absolute"
        },
        slots: [
          """
          <.alert color="info">
            <span>New message arrived.</span>
          </.alert>
          """
        ]
      },
      %Variation{
        id: :toast_top_start,
        attributes: %{
          horizontal: "start",
          vertical: "top",
          class: "absolute"
        },
        slots: [
          """
          <.alert color="success">
            <span>Top left notification!</span>
          </.alert>
          """
        ]
      },
      %Variation{
        id: :toast_top_center,
        attributes: %{
          horizontal: "center",
          vertical: "top",
          class: "absolute"
        },
        slots: [
          """
          <.alert color="warning">
            <span>Top center notification!</span>
          </.alert>
          """
        ]
      },
      %Variation{
        id: :toast_top_end,
        attributes: %{
          horizontal: "end",
          vertical: "top",
          class: "absolute"
        },
        slots: [
          """
          <.alert color="error">
            <span>Top right notification!</span>
          </.alert>
          """
        ]
      },
      %Variation{
        id: :toast_middle_center,
        attributes: %{
          horizontal: "center",
          vertical: "middle",
          class: "absolute"
        },
        slots: [
          """
          <.alert color="info">
            <span>Center notification!</span>
          </.alert>
          """
        ]
      },
      %Variation{
        id: :multiple_toasts,
        attributes: %{
          class: "absolute"
        },
        slots: [
          """
          <.alert color="info">
            <span>New mail arrived.</span>
          </.alert>
          <.alert color="success">
            <span>Message sent successfully.</span>
          </.alert>
          """
        ]
      }
    ]
  end
end
