defmodule DaisyUIComponents do
  @external_resource "README.md"

  @moduledoc @external_resource
             |> File.read!()
             |> String.split("<!-- MDOC -->")
             |> Enum.fetch!(1)

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
      import DaisyUIComponents.Form
      import DaisyUIComponents.Header
      import DaisyUIComponents.Icon
      import DaisyUIComponents.Input
      import DaisyUIComponents.Join
      import DaisyUIComponents.JSHelpers
      import DaisyUIComponents.List
      import DaisyUIComponents.Loading
      import DaisyUIComponents.Menu
      import DaisyUIComponents.Modal
      import DaisyUIComponents.Navbar
      import DaisyUIComponents.Pagination
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
