defmodule DaisyUIComponents.Swap do
  @moduledoc """
  Select component

  https://daisyui.com/components/swap
  """

  use DaisyUIComponents, :component

  import DaisyUIComponents.Icon

  attr :class, :any, default: nil
  attr :animation, :string, values: ["flip", "rotate"]
  attr :rest, :global

  slot :swap_on,
    doc:
      "the child element that should be visible when checkbox is checked or when swap is active" do
    attr :type, :string, values: ["label", "icon"]
    attr :name, :string, required: true
  end

  slot :swap_off,
    doc:
      "The child element that should be visible when checkbox is not checked or when swap is not active" do
    attr :type, :string, values: ["label", "icon"]
    attr :name, :string, required: true
  end

  slot :inner_block

  def swap(assigns) do
    assigns =
      assigns
      |> assign(:class, classes(["swap", animation(assigns[:animation]), assigns[:class]]))

    ~H"""
    <label class={@class} {@rest}>
      <%= if render?(@inner_block) do %>
        {render_slot(@inner_block)}
      <% else %>
        <input class="hidden" type="checkbox" />
      <% end %>
      <.swap_mode
        :for={swap_on <- @swap_on}
        type={Map.get(swap_on, :type, "label")}
        name={swap_on.name}
        mode="on"
      />
      <.swap_mode
        :for={swap_off <- @swap_off}
        type={Map.get(swap_off, :type, "label")}
        name={swap_off.name}
        mode="off"
      />
    </label>
    """
  end

  attr :class, :any, default: nil
  attr :mode, :string, required: true, values: ["on", "off"]
  attr :name, :string, required: true
  attr :type, :string, values: ["label", "icon"], default: "label"

  def swap_mode(assigns) do
    assigns =
      assigns
      |> assign_new(:mode_class, fn -> mode(assigns[:mode]) end)

    ~H"""
    <div :if={@type == "label"} class={classes([@mode_class, @class])}>{@name}</div>
    <.icon :if={@type == "icon"} name={@name} class={classes([@mode_class, @class])} />
    """
  end

  # Animation
  defp animation("flip"), do: "swap-flip"
  defp animation("rotate"), do: "swap-rotate"
  defp animation(_animation), do: nil

  # Mode
  defp mode("on"), do: "swap-on"
  defp mode("off"), do: "swap-off"
  defp mode(_mode), do: nil
end
