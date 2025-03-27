defmodule DaisyUIComponents.Tabs do
  @moduledoc """
  Tab component used to show a list of links in a tabbed format.

  Renders a list of tab links or toggles with radio toggle and content or label with radio toggle and content

  https://daisyui.com/components/tab/

  ## Basic Example:
      <.tabs>
        <.tab title="Tab 1" />
        <.tab title="Tab 2" active />
        <.tab title="Tab 3" disabled />
      </.tabs>

  ## Renders:
      <div role="tablist" class="tabs">
        <a role="tab" class="tab">Tab 1</a>
        <a role="tab" class="tab tab-active">Tab 2</a>
        <a role="tab" class="tab tab-disabled">Tab 3</a>
       </div>

  ## Basic Example with inner block content
  ## NOTE: if title attribute is provided, the inner block will not be rendered
      <.tabs>
        <.tab>
          <span>extra content</span>
          Tab 1
        </.tab>
        <.tab active>
          Tab 2
        </.tab>
        <.tab disabled>
          Tab 3
        </.tab>
      </.tabs>

  ## Renders:

      <div role="tablist" class="tabs">
        <a role="tab" class="tab">
          <span>extra content</span>
          Tab 1
        </a>
        <a role="tab" class="tab tab-active">
          Tab 2
        </a>
        <a role="tab" class="tab tab-disabled">
          Tab 3
        </a>
       </div>

  ## Tabs with button type
      <.tabs>
        <.tab type="button" title="Tab 1" />
        <.tab type="button" title="Tab 2" active />
        <.tab type="button" title="Tab 3" disabled />
      </.tabs>

  ## Renders:

      <div role="tablist" class="tabs">
        <button class="tab">Tab 1</button>
        <button class="tab tab-active">Tab 2</button>
        <button class="tab tab-disabled">Tab 3</button>
      </div>

  ## Tabs with radio type
  ## These tabs must provide a title attribute
      <.tabs>
        <.tab type="radio" title="Tab 1" name="tabs" />
        <.tab type="radio" title="Tab 2" name="tabs" active />
        <.tab type="radio" title="Tab 3" name="tabs" disabled />
      </.tabs>

  ## Renders:
      <div role="tablist" class="tabs">
        <input type="radio" name="tabs" aria-label="Tab 1" />
        <input type="radio" name="tabs" aria-label="Tab 2" checked="checked" />
        <input type="radio" name="tabs" aria-label="Tab 3" disabled />
      </div>

  """

  use DaisyUIComponents, :component

  attr :class, :any, default: nil
  attr :size, :string, values: sizes()
  attr :tabs_style, :string, values: ~w(box border lift)
  attr :tabs_position, :string, values: ~w(top bottom)
  attr :rest, :global

  slot :inner_block

  def tabs(assigns) do
    assigns =
      assign(assigns, :class, tabs_classes(assigns))

    ~H"""
    <div role="tablist" class={@class} {@rest}>
      {render_slot(@inner_block)}
    </div>
    """
  end

  attr :title, :string
  attr :class, :any, default: nil
  attr :type, :string, values: ~w(link button radio label), default: "link"
  attr :name, :string, default: nil
  attr :active, :boolean, default: false
  attr :disabled, :boolean, default: false
  attr :rest, :global

  slot :inner_block

  def tab(%{type: "radio", title: _title} = assigns) do
    assigns =
      assign(assigns, :class, radio_tab_classes(assigns))

    ~H"""
    <.tab_radio title={@title} name={@name} class={@class} active={@active} {@rest} />
    """
  end

  def tab(%{type: "radio"} = _assigns) do
    raise ArgumentError,
          "title attribute is required for radio type tab. Radio type tab cannot have inner block content"
  end

  def tab(%{type: "button", title: _title} = assigns) do
    assigns =
      assign(assigns, :class, tab_classes(assigns))

    ~H"""
    <.tab_button title={@title} class={@class} {@rest} />
    """
  end

  def tab(%{type: "button"} = assigns) do
    assigns =
      assign(assigns, :class, tab_classes(assigns))

    ~H"""
    <.tab_button class={@class} {@rest}>
      {render_slot(@inner_block)}
    </.tab_button>
    """
  end

  def tab(%{title: _title} = assigns) do
    assigns =
      assign(assigns, :class, tab_classes(assigns))

    ~H"""
    <.tab_link title={@title} class={@class} {@rest} />
    """
  end

  def tab(assigns) do
    assigns =
      assign(assigns, :class, tab_classes(assigns))

    ~H"""
    <.tab_link class={@class} {@rest}>
      {render_slot(@inner_block)}
    </.tab_link>
    """
  end

  attr :title, :string, required: true
  attr :name, :string, required: true
  attr :class, :any, default: nil
  attr :active, :boolean, default: false
  attr :rest, :global

  def tab_radio(assigns) do
    ~H"""
    <input
      type="radio"
      name={@name}
      class={@class}
      aria-label={@title}
      checked={@active && "checked"}
      {@rest}
    />
    """
  end

  attr :title, :string
  attr :class, :any, default: nil
  attr :rest, :global

  slot :inner_block

  def tab_button(%{title: _title} = assigns) do
    ~H"""
    <button class={@class} {@rest}>
      {@title}
    </button>
    """
  end

  def tab_button(assigns) do
    ~H"""
    <button class={@class} {@rest}>
      {render_slot(@inner_block)}
    </button>
    """
  end

  attr :title, :string
  attr :class, :any, default: nil
  attr :rest, :global

  slot :inner_block

  def tab_link(%{title: _title} = assigns) do
    ~H"""
    <a role="tab" class={@class} {@rest}>
      {@title}
    </a>
    """
  end

  def tab_link(assigns) do
    ~H"""
    <a role="tab" class={@class} {@rest}>
      {render_slot(@inner_block)}
    </a>
    """
  end

  attr :class, :any, default: nil
  attr :rest, :global

  slot :inner_block

  def tab_content(assigns) do
    assigns =
      assign(assigns, :class, tab_content_classes(assigns))

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
  defp tab_classes(assigns) do
    classes([
      "tab",
      maybe_add_class(assigns[:active], "tab-active"),
      maybe_add_class(assigns[:disabled], "tab-disabled")
    ])
  end

  defp radio_tab_classes(assigns) do
    # Instead of "tab-active" class, the checked attribute is used for radio tabs
    classes([
      "tab",
      maybe_add_class(assigns[:disabled], "tab-disabled")
    ])
  end

  defp tab_content_classes(assigns) do
    classes([
      "tab-content",
      assigns.class
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
