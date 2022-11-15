defmodule LiveDaisyuiComponents.Component do
  @moduledoc """
  Component
  """

  defmacro __using__(_) do
    quote do
      use Phoenix.Component
      import LiveDaisyuiComponents.Utils
    end
  end
end
