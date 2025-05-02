defmodule <%= if not @dev do @web_namespace <> "." end %>DaisyUIComponents do<%= if @dev do %>
  @external_resource "README.md"

  @moduledoc @external_resource
             |> File.read!()
             |> String.split("<!-- MDOC -->")
             |> Enum.fetch!(1)
<% end %>
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
      import <%= if not @dev do @web_namespace <> "." end %>DaisyUIComponents.Utils
      import <%= if not @dev do @web_namespace <> "." end %>DaisyUIComponents.JSHelpers

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
<%= for comp <- @components, do: "      import " <> (if not @dev, do: @web_namespace <> ".", else: "") <> "DaisyUIComponents." <> Macro.camelize(comp) <> "\n" %>    end
  end
end
