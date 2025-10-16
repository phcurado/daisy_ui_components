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

  defmacro __using__(opts) do
    core_components = Keyword.get(opts, :core_components, true)

    quote do
      unquote(
        if core_components do
          quote do
            import DaisyUIComponents.Button
            import DaisyUIComponents.Flash
            import DaisyUIComponents.Form
            import DaisyUIComponents.Icon
            import DaisyUIComponents.Header
            import DaisyUIComponents.Input
            import DaisyUIComponents.JSHelpers
            import DaisyUIComponents.List
            import DaisyUIComponents.Table
          end
        end
      )

      import DaisyUIComponents.Accordion
      import DaisyUIComponents.Alert
      import DaisyUIComponents.Avatar
      import DaisyUIComponents.Back
      import DaisyUIComponents.Badge
      import DaisyUIComponents.Breadcrumbs
      import DaisyUIComponents.Card
      import DaisyUIComponents.Checkbox
      import DaisyUIComponents.Collapse
      import DaisyUIComponents.Drawer
      import DaisyUIComponents.Dropdown
      import DaisyUIComponents.Fieldset
      import DaisyUIComponents.Footer
      import DaisyUIComponents.Hero
      import DaisyUIComponents.Indicator
      import DaisyUIComponents.Join
      import DaisyUIComponents.Label
      import DaisyUIComponents.Loading
      import DaisyUIComponents.Menu
      import DaisyUIComponents.Modal
      import DaisyUIComponents.Navbar
      import DaisyUIComponents.Pagination
      import DaisyUIComponents.Progress
      import DaisyUIComponents.Radio
      import DaisyUIComponents.Range
      import DaisyUIComponents.Select
      import DaisyUIComponents.Sidebar
      import DaisyUIComponents.Stat
      import DaisyUIComponents.Swap
      import DaisyUIComponents.Tabs
      import DaisyUIComponents.TextInput
      import DaisyUIComponents.Textarea
      import DaisyUIComponents.Toggle
      import DaisyUIComponents.Tooltip
    end
  end
end
