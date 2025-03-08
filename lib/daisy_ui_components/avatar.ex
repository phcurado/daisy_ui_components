defmodule DaisyUIComponents.Avatar do
  @moduledoc """
  Avatar component

  https://daisyui.com/components/avatar
  """

  use DaisyUIComponents, :component

  attr :class, :any, default: nil
  attr :placeholder, :boolean, default: false
  attr :online, :boolean, default: false
  attr :offline, :boolean, default: false
  attr :rest, :global
  slot :inner_block

  def avatar(assigns) do
    assigns =
      assign(
        assigns,
        :class,
        classes([
          "avatar",
          add_online_or_offline_class(assigns[:online], assigns[:offline]),
          maybe_add_class(assigns.placeholder, "avatar-placeholder"),
          assigns.class
        ])
      )

    ~H"""
    <div class={@class} {@rest}>
      {render_slot(@inner_block)}
    </div>
    """
  end

  attr :class, :any, default: nil
  attr :rest, :global
  slot :inner_block

  def avatar_group(assigns) do
    ~H"""
    <div class={classes(["avatar-group", @class])} {@rest}>
      {render_slot(@inner_block)}
    </div>
    """
  end

  defp add_online_or_offline_class(true = _online, _offline), do: "avatar-online"
  defp add_online_or_offline_class(_online, true = _offline), do: "avatar-offline"
  defp add_online_or_offline_class(_online, _offline), do: nil
end
