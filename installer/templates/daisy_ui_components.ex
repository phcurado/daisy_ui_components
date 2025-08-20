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

  defmacro __using__(opts) do
    core_components = Keyword.get(opts, :core_components, true)

    quote do
      if unquote(core_components) do
        <%= "import " <> (if not @dev, do: @web_namespace <> ".", else: "") <> "DaisyUIComponents.Button" %>
        <%= "import " <> (if not @dev, do: @web_namespace <> ".", else: "") <> "DaisyUIComponents.Flash" %>
        <%= "import " <> (if not @dev, do: @web_namespace <> ".", else: "") <> "DaisyUIComponents.Form" %>
        <%= "import " <> (if not @dev, do: @web_namespace <> ".", else: "") <> "DaisyUIComponents.Icon" %>
        <%= "import " <> (if not @dev, do: @web_namespace <> ".", else: "") <> "DaisyUIComponents.Header" %>
        <%= "import " <> (if not @dev, do: @web_namespace <> ".", else: "") <> "DaisyUIComponents.Input" %>
        <%= "import " <> (if not @dev, do: @web_namespace <> ".", else: "") <> "DaisyUIComponents.JSHelpers" %>
        <%= "import " <> (if not @dev, do: @web_namespace <> ".", else: "") <> "DaisyUIComponents.List" %>
        <%= "import " <> (if not @dev, do: @web_namespace <> ".", else: "") <> "DaisyUIComponents.Table" %>
      end

      <%= "import " <> (if not @dev, do: @web_namespace <> ".", else: "") <> "DaisyUIComponents.Accordion" %>
      <%= "import " <> (if not @dev, do: @web_namespace <> ".", else: "") <> "DaisyUIComponents.Alert" %>
      <%= "import " <> (if not @dev, do: @web_namespace <> ".", else: "") <> "DaisyUIComponents.Avatar" %>
      <%= "import " <> (if not @dev, do: @web_namespace <> ".", else: "") <> "DaisyUIComponents.Back" %>
      <%= "import " <> (if not @dev, do: @web_namespace <> ".", else: "") <> "DaisyUIComponents.Badge" %>
      <%= "import " <> (if not @dev, do: @web_namespace <> ".", else: "") <> "DaisyUIComponents.Breadcrumbs" %>
      <%= "import " <> (if not @dev, do: @web_namespace <> ".", else: "") <> "DaisyUIComponents.Card" %>
      <%= "import " <> (if not @dev, do: @web_namespace <> ".", else: "") <> "DaisyUIComponents.Checkbox" %>
      <%= "import " <> (if not @dev, do: @web_namespace <> ".", else: "") <> "DaisyUIComponents.Collapse" %>
      <%= "import " <> (if not @dev, do: @web_namespace <> ".", else: "") <> "DaisyUIComponents.Drawer" %>
      <%= "import " <> (if not @dev, do: @web_namespace <> ".", else: "") <> "DaisyUIComponents.Dropdown" %>
      <%= "import " <> (if not @dev, do: @web_namespace <> ".", else: "") <> "DaisyUIComponents.Fieldset" %>
      <%= "import " <> (if not @dev, do: @web_namespace <> ".", else: "") <> "DaisyUIComponents.Footer" %>
      <%= "import " <> (if not @dev, do: @web_namespace <> ".", else: "") <> "DaisyUIComponents.Hero" %>
      <%= "import " <> (if not @dev, do: @web_namespace <> ".", else: "") <> "DaisyUIComponents.Indicator" %>
      <%= "import " <> (if not @dev, do: @web_namespace <> ".", else: "") <> "DaisyUIComponents.Join" %>
      <%= "import " <> (if not @dev, do: @web_namespace <> ".", else: "") <> "DaisyUIComponents.Label" %>
      <%= "import " <> (if not @dev, do: @web_namespace <> ".", else: "") <> "DaisyUIComponents.Loading" %>
      <%= "import " <> (if not @dev, do: @web_namespace <> ".", else: "") <> "DaisyUIComponents.Menu" %>
      <%= "import " <> (if not @dev, do: @web_namespace <> ".", else: "") <> "DaisyUIComponents.Modal" %>
      <%= "import " <> (if not @dev, do: @web_namespace <> ".", else: "") <> "DaisyUIComponents.Navbar" %>
      <%= "import " <> (if not @dev, do: @web_namespace <> ".", else: "") <> "DaisyUIComponents.Pagination" %>
      <%= "import " <> (if not @dev, do: @web_namespace <> ".", else: "") <> "DaisyUIComponents.Progress" %>
      <%= "import " <> (if not @dev, do: @web_namespace <> ".", else: "") <> "DaisyUIComponents.Radio" %>
      <%= "import " <> (if not @dev, do: @web_namespace <> ".", else: "") <> "DaisyUIComponents.Range" %>
      <%= "import " <> (if not @dev, do: @web_namespace <> ".", else: "") <> "DaisyUIComponents.Select" %>
      <%= "import " <> (if not @dev, do: @web_namespace <> ".", else: "") <> "DaisyUIComponents.Stat" %>
      <%= "import " <> (if not @dev, do: @web_namespace <> ".", else: "") <> "DaisyUIComponents.Swap" %>
      <%= "import " <> (if not @dev, do: @web_namespace <> ".", else: "") <> "DaisyUIComponents.Tabs" %>
      <%= "import " <> (if not @dev, do: @web_namespace <> ".", else: "") <> "DaisyUIComponents.TextInput" %>
      <%= "import " <> (if not @dev, do: @web_namespace <> ".", else: "") <> "DaisyUIComponents.Textarea" %>
      <%= "import " <> (if not @dev, do: @web_namespace <> ".", else: "") <> "DaisyUIComponents.Toggle" %>
      <%= "import " <> (if not @dev, do: @web_namespace <> ".", else: "") <> "DaisyUIComponents.Tooltip" %>
    end
  end
end
