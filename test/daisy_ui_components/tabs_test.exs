defmodule DaisyUIComponents.TabsTest do
  use DaisyUIComponents.ComponentCase

  import Phoenix.Component
  import Phoenix.LiveViewTest
  import DaisyUIComponents.Tabs

  alias DaisyUIComponents.Utils

  test "tabs" do
    assigns = %{}

    ~H"""
    <.tabs>
      <:tab>Tab 1</:tab>
      <:tab active>Tab 2</:tab>
      <:tab disabled>Tab 3</:tab>
    </.tabs>
    """
    |> parse_component()
    |> assert_component("div")
    |> assert_class("tabs")
    |> select_element("a", fn [first, second, third] ->
      first_text =
        [first]
        |> assert_component("a")
        |> assert_class("tab")
        |> text()

      assert first_text =~ "Tab 1"

      second_text =
        [second]
        |> assert_component("a")
        |> assert_class("tab tab-active")
        |> text()

      assert second_text =~ "Tab 2"

      third_text =
        [third]
        |> assert_component("a")
        |> assert_class("tab tab-disabled")
        |> text()

      assert third_text =~ "Tab 3"
    end)
  end

  test "tabs sizes" do
    for size <- Utils.sizes() do
      assigns = %{size: size}

      ~H"""
      <.tabs size={@size}>
        <:tab>Tab 1</:tab>
      </.tabs>
      """
      |> parse_component()
      |> assert_component("div")
      |> assert_class("tabs tabs-#{size}")
    end
  end

  test "tabs styles" do
    for style <- ~w(box border lift) do
      assigns = %{tabs_style: style}

      ~H"""
      <.tabs tabs_style={@tabs_style}>
        <:tab>Tab 1</:tab>
      </.tabs>
      """
      |> parse_component()
      |> assert_component("div")
      |> assert_class("tabs tabs-#{style}")
    end
  end

  test "tabs position" do
    for position <- ~w(top bottom) do
      assigns = %{tabs_position: position}

      ~H"""
      <.tabs tabs_position={@tabs_position}>
        <:tab>Tab 1</:tab>
      </.tabs>
      """
      |> parse_component()
      |> assert_component("div")
      |> assert_class("tabs tabs-#{position}")
    end
  end

  test "radio tabs with content" do
    assigns = %{}

    component =
      ~H"""
      <.tabs type="radio" name="my_radio_tabs_1" tabs_style="border">
        <:tab>Tab 1</:tab>
        <:tab_content class="border-base-300 bg-base-100 p-10">Tab content 1</:tab_content>
        <:tab active>Tab 2</:tab>
        <:tab_content class="border-base-300 bg-base-100 p-10">Tab content 2</:tab_content>
        <:tab>Tab 3</:tab>
        <:tab_content class="border-base-300 bg-base-100 p-10">Tab content 3</:tab_content>
      </.tabs>
      """

    component_str = rendered_to_string(component) |> String.replace(~r/\s+/, "") |> String.trim()

    expected_component =
      ~H"""
      <div class="tabs tabs-border">
        <input type="radio" name="my_radio_tabs_1" class="tab" aria-label="Tab 1" />
        <div class="tab-content border-base-300 bg-base-100 p-10">Tab content 1</div>
        <input type="radio" name="my_radio_tabs_1" class="tab" aria-label="Tab 2" checked="checked" />
        <div class="tab-content border-base-300 bg-base-100 p-10">Tab content 2</div>
        <input type="radio" name="my_radio_tabs_1" class="tab" aria-label="Tab 3" />
        <div class="tab-content border-base-300 bg-base-100 p-10">Tab content 3</div>
      </div>
      """

    expected_component_str =
      rendered_to_string(expected_component) |> String.replace(~r/\s+/, "") |> String.trim()

    assert component_str == expected_component_str
  end

  test "label tabs with content" do
    assigns = %{}

    component =
      ~H"""
      <.tabs type="label" name="my_label_tabs_1" tabs_style="border">
        <:tab>Tab 1</:tab>
        <:tab_content class="border-base-300 bg-base-100 p-10">Tab content 1</:tab_content>
        <:tab active>Tab 2</:tab>
        <:tab_content class="border-base-300 bg-base-100 p-10">Tab content 2</:tab_content>
        <:tab>Tab 3</:tab>
        <:tab_content class="border-base-300 bg-base-100 p-10">Tab content 3</:tab_content>
      </.tabs>
      """

    component_str = rendered_to_string(component) |> String.replace(~r/\s+/, "") |> String.trim()

    expected_component =
      ~H"""
      <div class="tabs tabs-border">
        <label class="tab">
          <input type="radio" name="my_label_tabs_1" class="tab" /> Tab 1
        </label>
        <div class="tab-content border-base-300 bg-base-100 p-10">Tab content 1</div>
        <label class="tab">
          <input type="radio" name="my_label_tabs_1" class="tab" checked="checked" /> Tab 2
        </label>
        <div class="tab-content border-base-300 bg-base-100 p-10">Tab content 2</div>
        <label class="tab">
          <input type="radio" name="my_label_tabs_1" class="tab" /> Tab 3
        </label>
        <div class="tab-content border-base-300 bg-base-100 p-10">Tab content 3</div>
      </div>
      """

    expected_component_str =
      rendered_to_string(expected_component) |> String.replace(~r/\s+/, "") |> String.trim()

    assert component_str == expected_component_str
  end
end
