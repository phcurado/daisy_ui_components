defmodule DaisyUIComponents do
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
      import DaisyUIComponents.Utils
      import DaisyUIComponents.JSHelpers

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
      import DaisyUIComponents.Alert
      import DaisyUIComponents.Avatar
      import DaisyUIComponents.Back
      import DaisyUIComponents.Badge
      import DaisyUIComponents.Breadcrumbs
      import DaisyUIComponents.Button
      import DaisyUIComponents.Card
      import DaisyUIComponents.Checkbox
      import DaisyUIComponents.Drawer
      import DaisyUIComponents.Dropdown
      import DaisyUIComponents.Fieldset
      import DaisyUIComponents.Form
      import DaisyUIComponents.Header
      import DaisyUIComponents.Hero
      import DaisyUIComponents.Icon
      import DaisyUIComponents.Indicator
      import DaisyUIComponents.Input
      import DaisyUIComponents.Join
      import DaisyUIComponents.JSHelpers
      # import DaisyUIComponents.Label
      import DaisyUIComponents.List
      import DaisyUIComponents.Loading
      import DaisyUIComponents.Menu
      import DaisyUIComponents.Modal
      import DaisyUIComponents.Navbar
      import DaisyUIComponents.Pagination
      import DaisyUIComponents.Progress
      import DaisyUIComponents.Radio
      import DaisyUIComponents.Range
      import DaisyUIComponents.Select
      import DaisyUIComponents.Stat
      import DaisyUIComponents.Swap
      import DaisyUIComponents.Table
      import DaisyUIComponents.TextInput
      import DaisyUIComponents.Textarea
      import DaisyUIComponents.Toggle
      import DaisyUIComponents.Tooltip
    end
  end
end
