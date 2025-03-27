defmodule DaisyUIComponents.TabsTest do
  use DaisyUIComponents.ComponentCase

  import Phoenix.Component
  import Phoenix.LiveViewTest
  import DaisyUIComponents.Tabs

  alias DaisyUIComponents.Utils

  describe "tabs with links (default)" do
    test "basic default tabs with title" do
      assigns = %{}

      component =
        ~H"""
        <.tabs>
          <.tab title="Tab 1" />
          <.tab title="Tab 2" active />
          <.tab title="Tab 3" disabled />
        </.tabs>
        """

      expected_component =
        ~H"""
        <div role="tablist" class="tabs">
          <a role="tab" class="tab">Tab 1</a>
          <a role="tab" class="tab tab-active">Tab 2</a>
          <a role="tab" class="tab tab-disabled">Tab 3</a>
        </div>
        """

      assert_components(component, expected_component)
    end

    test "basic default tabs with inner block" do
      assigns = %{}

      component =
        ~H"""
        <.tabs>
          <.tab>
            Tab 1 <span>Extra content</span>
          </.tab>
          <.tab active>Tab 2</.tab>
          <.tab disabled>Tab 3</.tab>
        </.tabs>
        """

      expected_component =
        ~H"""
        <div role="tablist" class="tabs">
          <a role="tab" class="tab">Tab 1 <span>Extra content</span></a>
          <a role="tab" class="tab tab-active">Tab 2</a>
          <a role="tab" class="tab tab-disabled">Tab 3</a>
        </div>
        """

      assert_components(component, expected_component)
    end

    test "basic default tabs ignores inner block when title is provided" do
      assigns = %{}

      component =
        ~H"""
        <.tabs>
          <.tab title="Tab 1">
            Ignored Tab 1 <span>Extra content</span>
          </.tab>
          <.tab title="Tab 2" active>
            Ignored Tab 2
          </.tab>
          <.tab title="Tab 3" disabled>
            Ignored Tab 3
          </.tab>
        </.tabs>
        """

      expected_component =
        ~H"""
        <div role="tablist" class="tabs">
          <a role="tab" class="tab">Tab 1</a>
          <a role="tab" class="tab tab-active">Tab 2</a>
          <a role="tab" class="tab tab-disabled">Tab 3</a>
        </div>
        """

      assert_components(component, expected_component)
    end

    test "tabs sizes" do
      for size <- Utils.sizes() do
        assigns = %{size: size}

        ~H"""
        <.tabs size={@size}>
          <.tab>Tab 1</.tab>
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
          <.tab>Tab 1</.tab>
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
          <.tab>Tab 1</.tab>
        </.tabs>
        """
        |> parse_component()
        |> assert_component("div")
        |> assert_class("tabs tabs-#{position}")
      end
    end
  end

  describe "tabs with buttons" do
    test "basic button tabs with title" do
      assigns = %{}

      component =
        ~H"""
        <.tabs>
          <.tab type="button" title="Tab 1" />
          <.tab type="button" title="Tab 2" active />
          <.tab type="button" title="Tab 3" disabled />
        </.tabs>
        """

      expected_component =
        ~H"""
        <div role="tablist" class="tabs">
          <button class="tab">Tab 1</button>
          <button class="tab tab-active">Tab 2</button>
          <button class="tab tab-disabled">Tab 3</button>
        </div>
        """

      assert_components(component, expected_component)
    end

    test "basic button tabs with inner block" do
      assigns = %{}

      component =
        ~H"""
        <.tabs>
          <.tab type="button">
            Tab 1 <span>Extra content</span>
          </.tab>
          <.tab type="button" active>Tab 2</.tab>
          <.tab type="button" disabled>Tab 3</.tab>
        </.tabs>
        """

      expected_component =
        ~H"""
        <div role="tablist" class="tabs">
          <button class="tab">Tab 1 <span>Extra content</span></button>
          <button class="tab tab-active">Tab 2</button>
          <button class="tab tab-disabled">Tab 3</button>
        </div>
        """

      assert_components(component, expected_component)
    end
  end

  describe "tabs with radio inputs" do
    test "basic radio tabs with title" do
      assigns = %{}

      component =
        ~H"""
        <.tabs>
          <.tab type="radio" title="Tab 1" name="my_radio_tabs" />
          <.tab id="just_testing" type="radio" title="Tab 2" name="my_radio_tabs" active />
          <.tab type="radio" title="Tab 3" name="my_radio_tabs" disabled />
        </.tabs>
        """

      expected_component =
        ~H"""
        <div role="tablist" class="tabs">
          <input type="radio" name="my_radio_tabs" class="tab" aria-label="Tab 1" />
          <input
            type="radio"
            name="my_radio_tabs"
            class="tab"
            aria-label="Tab 2"
            checked="checked"
            id="just_testing"
          />
          <input type="radio" name="my_radio_tabs" class="tab tab-disabled" aria-label="Tab 3" />
        </div>
        """

      assert_components(component, expected_component)
    end

    test "raise error when title is not provided" do
      assigns = %{}

      assert_raise(
        ArgumentError,
        "title attribute is required for radio type tab. Radio type tab cannot have inner block content",
        fn ->
          ~H"""
          <.tabs>
            <.tab type="radio" />
          </.tabs>
          """
          |> parse_component()
        end
      )
    end

    test "radio tabs with tab content" do
      assigns = %{}

      component =
        ~H"""
        <.tabs tabs_style="lift" tabs_position="bottom">
          <.tab type="radio" title="Tab 1" name="my_tabs_with_content" />
          <.tab_content class="bg-base-100 border-base-300 p-6">Tab content 1</.tab_content>
          <.tab type="radio" title="Tab 2" name="my_tabs_with_content" active />
          <.tab_content class="bg-base-100 border-base-300 p-6">Tab content 2</.tab_content>
          <.tab type="radio" title="Tab 3" name="my_tabs_with_content" disabled />
          <.tab_content class="bg-base-100 border-base-300 p-6">Tab content 3</.tab_content>
        </.tabs>
        """

      expected_component =
        ~H"""
        <div role="tablist" class="tabs tabs-lift tabs-bottom">
          <input type="radio" name="my_tabs_with_content" class="tab" aria-label="Tab 1" />
          <div class="tab-content bg-base-100 border-base-300 p-6">Tab content 1</div>

          <input
            type="radio"
            name="my_tabs_with_content"
            class="tab"
            aria-label="Tab 2"
            checked="checked"
          />
          <div class="tab-content bg-base-100 border-base-300 p-6">Tab content 2</div>

          <input type="radio" name="my_tabs_with_content" class="tab tab-disabled" aria-label="Tab 3" />
          <div class="tab-content bg-base-100 border-base-300 p-6">Tab content 3</div>
        </div>
        """

      assert_components(component, expected_component)
    end
  end

  describe "tabs with labels" do
    test "basic tabs with labels with title" do
      assigns = %{}

      component =
        ~H"""
        <.tabs>
          <.tab type="label" title="Tab 1" name="my_label_tabs" />
          <.tab type="label" title="Tab 2" name="my_label_tabs" active />
          <.tab type="label" title="Tab 3" name="my_label_tabs" disabled />
        </.tabs>
        """

      expected_component =
        ~H"""
        <div role="tablist" class="tabs">
          <label class="tab">
            <input type="radio" name="my_label_tabs" /> Tab 1
          </label>
          <label class="tab tab-active">
            <input type="radio" name="my_label_tabs" checked="checked" /> Tab 2
          </label>
          <label class="tab tab-disabled">
            <input type="radio" name="my_label_tabs" /> Tab 3
          </label>
        </div>
        """

      assert_components(component, expected_component)
    end

    test "basic tabs with labels with inner block" do
      assigns = %{}

      component =
        ~H"""
        <.tabs>
          <.tab type="label" name="my_label_tabs">
            Tab 1 <span>Extra content</span>
          </.tab>
          <.tab type="label" name="my_label_tabs" active>
            Tab 2
          </.tab>
          <.tab type="label" name="my_label_tabs" disabled>
            Tab 3
          </.tab>
        </.tabs>
        """

      expected_component =
        ~H"""
        <div role="tablist" class="tabs">
          <label class="tab">
            <input type="radio" name="my_label_tabs" /> Tab 1 <span>Extra content</span>
          </label>
          <label class="tab tab-active">
            <input type="radio" name="my_label_tabs" checked="checked" /> Tab 2
          </label>
          <label class="tab tab-disabled">
            <input type="radio" name="my_label_tabs" /> Tab 3
          </label>
        </div>
        """

      assert_components(component, expected_component)
    end

    test "tabs with label content" do
      assigns = %{}

      component =
        ~H"""
        <.tabs tabs_style="lift" tabs_position="bottom">
          <.tab type="label" title="Tab 1" name="my_tabs_with_content" />
          <.tab_content class="bg-base-100 border-base-300 p-6">Tab content 1</.tab_content>
          <.tab type="label" title="Tab 2" name="my_tabs_with_content" active />
          <.tab_content class="bg-base-100 border-base-300 p-6">Tab content 2</.tab_content>
          <.tab type="label" title="Tab 3" name="my_tabs_with_content" disabled />
          <.tab_content class="bg-base-100 border-base-300 p-6">Tab content 3</.tab_content>
        </.tabs>
        """

      expected_component =
        ~H"""
        <div role="tablist" class="tabs tabs-lift tabs-bottom">
          <label class="tab">
            <input type="radio" name="my_tabs_with_content" /> Tab 1
          </label>
          <div class="tab-content bg-base-100 border-base-300 p-6">Tab content 1</div>

          <label class="tab tab-active">
            <input type="radio" name="my_tabs_with_content" checked="checked" /> Tab 2
          </label>
          <div class="tab-content bg-base-100 border-base-300 p-6">Tab content 2</div>

          <label class="tab tab-disabled">
            <input type="radio" name="my_tabs_with_content" /> Tab 3
          </label>
          <div class="tab-content bg-base-100 border-base-300 p-6">Tab content 3</div>
        </div>
        """

      assert_components(component, expected_component)
    end
  end

  defp assert_components(rendered_component, expected_component) do
    rendered_component_str = rendered_to_string(rendered_component) |> remove_whitespace()
    expected_component_str = rendered_to_string(expected_component) |> remove_whitespace()
    assert rendered_component_str == expected_component_str
  end

  defp remove_whitespace(str) do
    str
    |> String.replace(~r/\s+/, "")
    |> String.trim()
  end
end
