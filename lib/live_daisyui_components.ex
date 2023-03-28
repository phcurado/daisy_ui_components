defmodule LiveDaisyuiComponents do
  @moduledoc """
  Documentation for `LiveDaisyuiComponents`.
  """

  defmacro __using__(_) do
    quote do
      import LiveDaisyuiComponents.Alert
      import LiveDaisyuiComponents.Avatar
      import LiveDaisyuiComponents.Button
      import LiveDaisyuiComponents.Card
      import LiveDaisyuiComponents.Checkbox
      import LiveDaisyuiComponents.Modal
      import LiveDaisyuiComponents.Table
      import LiveDaisyuiComponents.TextInput
      import LiveDaisyuiComponents.Textarea
      import LiveDaisyuiComponents.Select
    end
  end
end
