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
  Get the attribute of a component
  """
  def attribute(fragment, attribute) do
    fragment
    |> Floki.attribute(attribute)
    |> case do
      [value] -> value
      [] -> nil
      _ -> raise "Multiple attributes found"
    end
  end

  @doc """
  Asserts the attribute in a component
  """
  def assert_attribute(fragment, attribute, value) do
    fragment
    |> attribute(attribute)
    |> then(fn attr_value ->
      assert attr_value == value
    end)

    # return the fragment so we can pipe multiple assertions
    fragment
  end

  @doc """
  Asserts the attribute class in a component
  """
  def assert_class(fragment, value) do
    fragment
    |> assert_attribute("class", value)
  end
end
