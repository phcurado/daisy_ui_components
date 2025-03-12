defmodule DaisyUIComponents.LabelTest do
  use DaisyUIComponents.ComponentCase

  import Phoenix.Component
  import DaisyUIComponents.Label

  test "label" do
    assigns = %{}

    ~H"""
    <.label class="w-xs">label slot</.label>
    """
    |> parse_component()
    |> assert_component("label")
    |> assert_class("label w-xs")
    |> assert_text("label slot")
  end

  test "label input" do
    assigns = %{}

    ~H"""
    <.label type="input" text="input label" class="w-xs">
      <input type="text" placeholder="URL" />
    </.label>
    """
    |> parse_component()
    |> assert_component("label")
    |> assert_class("input w-xs")
    |> select_element("span", fn element ->
      element
      |> assert_component("span")
      |> assert_text("input label")
    end)
    |> select_element("input", fn element ->
      element
      |> assert_component("input")
    end)
  end

  test "label select" do
    assigns = %{}

    ~H"""
    <.label type="select" text="input label" class="w-xs">
      <select />
    </.label>
    """
    |> parse_component()
    |> assert_component("label")
    |> assert_class("select w-xs")
    |> select_element("span", fn element ->
      element
      |> assert_component("span")
      |> assert_text("input label")
    end)
    |> select_element("select", fn element ->
      element
      |> assert_component("select")
    end)
  end

  test "label floating" do
    assigns = %{}

    ~H"""
    <.label type="floating" text="Your email">
      <input type="text" placeholder="mail@site.com" class="input input-md" />
    </.label>
    """
    |> parse_component()
    |> assert_component("label")
    |> assert_class("floating-label")
    |> select_element("span", fn element ->
      element
      |> assert_component("span")
      |> assert_text("Your email")
    end)
    |> select_element("input", fn element ->
      element
      |> assert_component("input")
    end)
  end

  test "label positions" do
    assigns = %{}

    ~H"""
    <.label type="input" text=".com" position="end">
      <input type="text" placeholder="domain name" />
    </.label>
    """
    |> parse_component()
    |> assert_component("label")
    |> assert_class("input")
    |> select_element("span", fn element ->
      element
      |> assert_component("span")
      |> assert_text(".com")
    end)
    |> select_element("input", fn element ->
      element
      |> assert_component("input")
    end)
    |> select_element("label", fn element ->
      [{"label", _attr, child}] = element
      # assert order of elements
      assert [{"input", _, _}, {"span", _, _}] = child
    end)
  end
end
