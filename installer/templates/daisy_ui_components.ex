defmodule <%= @web_namespace %>.DaisyUIComponents do
  @external_resource "README.md"

  @moduledoc @external_resource
             |> File.read!()
             |> String.split("<!-- MDOC -->")
             |> Enum.fetch!(1)

  @doc false
  def live_component do
    quote do
      use Phoenix.LiveComponent

      unquote(helpers())
    end
  end

  @doc false
  def component do
    quote do
      use Phoenix.Component

      unquote(helpers())
    end
  end

  defp helpers() do
    quote do
      import <%= @web_namespace %>.DaisyUIComponents.Utils
      import <%= @web_namespace %>.DaisyUIComponents.JSHelpers

      alias Phoenix.LiveView.JS
    end
  end

  @doc """
  Used for functional or live components
  """
  defmacro __using__(which) when is_atom(which) do
    apply(__MODULE__, which, [])
  end

  defmacro __using__(_) do
    quote do
      import <%= @web_namespace %>.DaisyUIComponents.Alert
      import <%= @web_namespace %>.DaisyUIComponents.Avatar
      import <%= @web_namespace %>.DaisyUIComponents.Back
      import <%= @web_namespace %>.DaisyUIComponents.Badge
      import <%= @web_namespace %>.DaisyUIComponents.Breadcrumbs
      import <%= @web_namespace %>.DaisyUIComponents.Button
      import <%= @web_namespace %>.DaisyUIComponents.Card
      import <%= @web_namespace %>.DaisyUIComponents.Checkbox
      import <%= @web_namespace %>.DaisyUIComponents.Drawer
      import <%= @web_namespace %>.DaisyUIComponents.Dropdown
      import <%= @web_namespace %>.DaisyUIComponents.Fieldset
      import <%= @web_namespace %>.DaisyUIComponents.Footer
      import <%= @web_namespace %>.DaisyUIComponents.Form
      import <%= @web_namespace %>.DaisyUIComponents.Header
      import <%= @web_namespace %>.DaisyUIComponents.Hero
      import <%= @web_namespace %>.DaisyUIComponents.Icon
      import <%= @web_namespace %>.DaisyUIComponents.Indicator
      import <%= @web_namespace %>.DaisyUIComponents.Input
      import <%= @web_namespace %>.DaisyUIComponents.Join
      import <%= @web_namespace %>.DaisyUIComponents.JSHelpers
      import <%= @web_namespace %>.DaisyUIComponents.Label
      import <%= @web_namespace %>.DaisyUIComponents.List
      import <%= @web_namespace %>.DaisyUIComponents.Loading
      import <%= @web_namespace %>.DaisyUIComponents.Menu
      import <%= @web_namespace %>.DaisyUIComponents.Modal
      import <%= @web_namespace %>.DaisyUIComponents.Navbar
      import <%= @web_namespace %>.DaisyUIComponents.Pagination
      import <%= @web_namespace %>.DaisyUIComponents.Progress
      import <%= @web_namespace %>.DaisyUIComponents.Radio
      import <%= @web_namespace %>.DaisyUIComponents.Range
      import <%= @web_namespace %>.DaisyUIComponents.Select
      import <%= @web_namespace %>.DaisyUIComponents.Stat
      import <%= @web_namespace %>.DaisyUIComponents.Swap
      import <%= @web_namespace %>.DaisyUIComponents.Table
      import <%= @web_namespace %>.DaisyUIComponents.TextInput
      import <%= @web_namespace %>.DaisyUIComponents.Textarea
      import <%= @web_namespace %>.DaisyUIComponents.Toggle
      import <%= @web_namespace %>.DaisyUIComponents.Tooltip
    end
  end
end
