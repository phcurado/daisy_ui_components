defmodule DaisyUIComponents.Tabs do
  @moduledoc """
  Tab component

  Renders a list of tab links or toggles with radio toggle and content or label with radio toggle and content

  https://daisyui.com/components/tab/
  """

  use DaisyUIComponents, :component

  @doc """
  Renders a Tabs with links as toggle by default.

  ## Default Example
  <.tabs>
    <:tab>Tab 1</:tab>
    <:tab active>Tab 2</:tab>
    <:tab disabled>Tab 3</:tab>
  </.tabs>

  ## Renders
  <div role="tablist" class="tabs">
    <a role="tab" class="tab">Tab 1</a>
    <a role="tab" class="tab tab-active">Tab 2</a>
    <a role="tab" class="tab tab-disabled">Tab 3</a>
  </div>

  ## Radio Example
  ## https://daisyui.com/components/tab/#radio-tabs-border--tab-content
  <.tabs type="radio">
    <:tab>Tab 1</:tab>
    <:tab active>Tab 2</:tab>
    <:tab>Tab 3</:tab>
  </.tabs>

  ## Renders
  <div class="tabs">
    <input type="radio" name="tabs" class="tab" aria-label="Tab 1">
    <input type="radio" name="tabs" class="tab" aria-label="Tab 2" checked="checked">
    <input type="radio" name="tabs" class="tab" aria-label="Tab 3">
  </div>

  ## Label Example
  ## https://daisyui.com/components/tab/#radio-tabs-lift-with-icons--tab-content
  <.tabs type="label">
    <:tab>Tab 1</:tab>
    <:tab active>Tab 2</:tab>
    <:tab>Tab 3</:tab>
  </.tabs>

  ## Renders
  <div class="tabs">
    <label class="tab">
      <input type="radio" name="tabs" class="tab"> Tab 1
    </label>
    <label class="tab">
      <input type="radio" name="tabs" class="tab" checked="checked"> Tab 2
    </label>
    <label class="tab">
      <input type="radio" name="tabs" class="tab"> Tab 3
    </label>
  </div>
  """

  attr :type, :string, values: ~w(link radio label), default: "link"
  attr :name, :string, default: nil
  attr :class, :any, default: nil
  attr :size, :string, values: sizes()
  attr :tabs_style, :string, values: ~w(box border lift)
  attr :tabs_position, :string, values: ~w(top bottom)
  attr :rest, :global

  slot :tab do
    attr :active, :boolean
    attr :disabled, :boolean
  end

  slot :tab_content

  slot :inner_block

  def tabs(%{type: "radio"} = assigns) do
    assigns =
      assign(assigns, :class, tabs_classes(assigns))

    ~H"""
    <div class={@class} {@rest}>
      <%= for {tab, index} <- Enum.with_index(@tab) do %>
        <.tab_radio
          name={@name}
          class={radio_tab_classes(tab)}
          aria_label={render_slot(tab)}
          active={tab[:active]}
        />

        <% tab_content = Enum.at(@tab_content, index) %>
        <.tab_content :if={tab_content} class={tab_content_classes(tab_content)}>
          {render_slot(tab_content)}
        </.tab_content>
      <% end %>

      {render_slot(@inner_block)}
    </div>
    """
  end

  def tabs(%{type: "label"} = assigns) do
    assigns =
      assign(assigns, :class, tabs_classes(assigns))

    ~H"""
    <div class={@class} {@rest}>
      <%= for {tab, index} <- Enum.with_index(@tab) do %>
        <label class={label_tab_classes(tab)}>
          <.tab_radio name={@name} class={radio_tab_classes(tab)} active={tab[:active]} />
          {render_slot(tab)}
        </label>

        <% tab_content = Enum.at(@tab_content, index) %>
        <.tab_content :if={tab_content} class={tab_content_classes(tab_content)}>
          {render_slot(tab_content)}
        </.tab_content>
      <% end %>

      {render_slot(@inner_block)}
    </div>
    """
  end

  # This is default for tabs with links. From the examples, tab content is not rendered as part of this block
  def tabs(assigns) do
    assigns =
      assign(assigns, :class, tabs_classes(assigns))

    ~H"""
    <div role="tablist" class={@class} {@rest}>
      <.tab_link :for={tab <- @tab} class={tab_classes(tab)}>
        {render_slot(tab)}
      </.tab_link>
      {render_slot(@inner_block)}
    </div>
    """
  end

  attr :class, :any, default: nil
  attr :rest, :global

  slot :inner_block

  def tab_link(assigns) do
    ~H"""
    <a role="tab" class={@class} {@rest}>
      {render_slot(@inner_block)}
    </a>
    """
  end

  attr :class, :any, default: nil
  attr :name, :string, default: nil
  attr :active, :boolean, default: false
  attr :aria_label, :string, default: nil
  attr :rest, :global

  def tab_radio(assigns) do
    ~H"""
    <input
      type="radio"
      name={@name}
      class={@class}
      aria-label={@aria_label}
      checked={@active && "checked"}
      {@rest}
    />
    """
  end

  attr :class, :any, default: nil
  attr :rest, :global

  slot :inner_block

  def tab_content(assigns) do
    ~H"""
    <div class={@class} {@rest}>
      {render_slot(@inner_block)}
    </div>
    """
  end

  # Wrapper Classes
  defp tabs_classes(assigns) do
    classes([
      "tabs",
      tabs_size(assigns[:size]),
      tabs_style(assigns[:tabs_style]),
      tabs_position(assigns[:tabs_position]),
      assigns.class
    ])
  end

  # Individual Tab Classes
  defp tab_classes(tab) do
    classes([
      "tab",
      maybe_add_class(tab[:active], "tab-active"),
      maybe_add_class(tab[:disabled], "tab-disabled")
    ])
  end

  defp tab_content_classes(tab_content) do
    classes([
      "tab-content",
      tab_content[:class]
    ])
  end

  defp radio_tab_classes(tab) do
    classes([
      "tab",
      tab[:class]
    ])
  end

  defp label_tab_classes(tab) do
    classes([
      "tab",
      tab[:class]
    ])
  end

  # Sizes
  defp tabs_size("xs"), do: "tabs-xs"
  defp tabs_size("sm"), do: "tabs-sm"
  defp tabs_size("md"), do: "tabs-md"
  defp tabs_size("lg"), do: "tabs-lg"
  defp tabs_size("xl"), do: "tabs-xl"
  defp tabs_size(_size), do: nil

  # Styles
  defp tabs_style("box"), do: "tabs-box"
  defp tabs_style("border"), do: "tabs-border"
  defp tabs_style("lift"), do: "tabs-lift"
  defp tabs_style(_style), do: nil

  # Positions
  defp tabs_position("top"), do: "tabs-top"
  defp tabs_position("bottom"), do: "tabs-bottom"
  defp tabs_position(_position), do: nil
end
