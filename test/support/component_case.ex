defmodule DaisyUIComponents.ComponentCase do
  @moduledoc """
  This module defines the test case to be used by
  tests that require `Floki` helpers
  """

  use ExUnit.CaseTemplate

  import Phoenix.LiveViewTest

  using do
    quote do
      # Importing this module for convenience
      import DaisyUIComponents.ComponentCase
      import Phoenix.Component
    end
  end

  @doc """
  Parse the component with Floki
  """
  def parse_component(heex) do
    heex
    |> rendered_to_string()
    |> Floki.parse_fragment!()
  end

  @doc """
  Assert component html tag
  """
  def assert_component(html, tag) do
    {html_tag, _, _} = Enum.at(html, 0)
    assert html_tag == tag

    html
  end

  @doc """
  Get the attribute of a component
  """
  def attribute(html, attribute) do
    html
    |> Floki.attribute(attribute)
    |> case do
      [value] -> value
      [] -> nil
      _ -> raise "Multiple attributes found"
    end
  end

  @doc """
  Get the text of a component
  """
  def text(html) do
    html
    |> Floki.text()
  end

  @doc """
  Execute a function on a component
  """
  def select_element(html, selector, func) do
    html
    |> Floki.find(selector)
    |> func.()

    html
  end

  @doc """
  Asserts the attribute in a component
  """
  def assert_attribute(html, attribute, value) do
    html
    |> attribute(attribute)
    |> then(fn attr_value ->
      assert attr_value == value
    end)

    html
  end

  @doc """
  Asserts the attribute class in a component
  """
  def assert_class(html, value) do
    html
    |> assert_attribute("class", value)
  end

  @doc """
  Asserts the text in a component
  """
  def assert_text(html, value) do
    html
    |> text()
    |> String.trim()
    |> then(fn text_value ->
      assert text_value == value
    end)
  end
end
