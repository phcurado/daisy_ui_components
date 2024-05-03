defmodule DaisyUIComponents.Avatar do
  @moduledoc """
  Avatar component

  https://daisyui.com/components/avatar


  """

  use DaisyUIComponents.Component

  attr :online, :boolean, default: false
  attr :offline, :boolean, default: false
  attr :rest, :global
  slot :inner_block

  def avatar(assigns) do
    assigns =
      join_classes_with_rest(assigns, [
        "avatar",
        add_online_or_offline_class(assigns[:online], assigns[:offline])
      ])

    ~H"""
    <div {@rest}>
      <%= render_slot(@inner_block) %>
    </div>
    """
  end

  attr :rest, :global
  slot :inner_block

  def avatar_group(assigns) do
    assigns = join_classes_with_rest(assigns, ["avatar-group"])

    ~H"""
    <div {@rest}>
      <%= render_slot(@inner_block) %>
    </div>
    """
  end

  defp add_online_or_offline_class(true = _online, _offline), do: "online"
  defp add_online_or_offline_class(_online, true = _offline), do: "offline"
  defp add_online_or_offline_class(_online, _offline), do: nil
end
