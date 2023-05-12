defmodule LiveDaisyuiComponents do
  @moduledoc """
  Documentation for `LiveDaisyuiComponents`.
  """

  defmacro __using__(_) do
    quote do
      import LiveDaisyuiComponents.Alert
      import LiveDaisyuiComponents.Avatar
      import LiveDaisyuiComponents.Button
      import LiveDaisyuiComponents.ButtonGroup
      import LiveDaisyuiComponents.Card
      import LiveDaisyuiComponents.Checkbox
      import LiveDaisyuiComponents.Drawer
      import LiveDaisyuiComponents.Form
      import LiveDaisyuiComponents.Icon
      import LiveDaisyuiComponents.Input
      import LiveDaisyuiComponents.Modal
      import LiveDaisyuiComponents.Pagination
      import LiveDaisyuiComponents.Select
      import LiveDaisyuiComponents.Table
      import LiveDaisyuiComponents.TextInput
      import LiveDaisyuiComponents.Textarea
    end
  end
end
