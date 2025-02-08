defmodule DaisyUIComponents.Component do
  @moduledoc false

  defmacro __using__(_) do
    quote do
      use Phoenix.Component
      import DaisyUIComponents.Utils
      import DaisyUIComponents.JSHelpers
    end
  end
end
