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
      import <%= if not @dev do @web_namespace <> "." end %>DaisyUIComponents.Alert
      import <%= if not @dev do @web_namespace <> "." end %>DaisyUIComponents.Avatar
      import <%= if not @dev do @web_namespace <> "." end %>DaisyUIComponents.Back
      import <%= if not @dev do @web_namespace <> "." end %>DaisyUIComponents.Badge
      import <%= if not @dev do @web_namespace <> "." end %>DaisyUIComponents.Breadcrumbs
      import <%= if not @dev do @web_namespace <> "." end %>DaisyUIComponents.Button
      import <%= if not @dev do @web_namespace <> "." end %>DaisyUIComponents.Card
      import <%= if not @dev do @web_namespace <> "." end %>DaisyUIComponents.Checkbox
      import <%= if not @dev do @web_namespace <> "." end %>DaisyUIComponents.Drawer
      import <%= if not @dev do @web_namespace <> "." end %>DaisyUIComponents.Dropdown
      import <%= if not @dev do @web_namespace <> "." end %>DaisyUIComponents.Fieldset
      import <%= if not @dev do @web_namespace <> "." end %>DaisyUIComponents.Footer
      import <%= if not @dev do @web_namespace <> "." end %>DaisyUIComponents.Form
      import <%= if not @dev do @web_namespace <> "." end %>DaisyUIComponents.Header
      import <%= if not @dev do @web_namespace <> "." end %>DaisyUIComponents.Hero
      import <%= if not @dev do @web_namespace <> "." end %>DaisyUIComponents.Icon
      import <%= if not @dev do @web_namespace <> "." end %>DaisyUIComponents.Indicator
      import <%= if not @dev do @web_namespace <> "." end %>DaisyUIComponents.Input
      import <%= if not @dev do @web_namespace <> "." end %>DaisyUIComponents.Join
      import <%= if not @dev do @web_namespace <> "." end %>DaisyUIComponents.JSHelpers
      import <%= if not @dev do @web_namespace <> "." end %>DaisyUIComponents.Label
      import <%= if not @dev do @web_namespace <> "." end %>DaisyUIComponents.List
      import <%= if not @dev do @web_namespace <> "." end %>DaisyUIComponents.Loading
      import <%= if not @dev do @web_namespace <> "." end %>DaisyUIComponents.Menu
      import <%= if not @dev do @web_namespace <> "." end %>DaisyUIComponents.Modal
      import <%= if not @dev do @web_namespace <> "." end %>DaisyUIComponents.Navbar
      import <%= if not @dev do @web_namespace <> "." end %>DaisyUIComponents.Pagination
      import <%= if not @dev do @web_namespace <> "." end %>DaisyUIComponents.Progress
      import <%= if not @dev do @web_namespace <> "." end %>DaisyUIComponents.Radio
      import <%= if not @dev do @web_namespace <> "." end %>DaisyUIComponents.Range
      import <%= if not @dev do @web_namespace <> "." end %>DaisyUIComponents.Select
      import <%= if not @dev do @web_namespace <> "." end %>DaisyUIComponents.Stat
      import <%= if not @dev do @web_namespace <> "." end %>DaisyUIComponents.Swap
      import <%= if not @dev do @web_namespace <> "." end %>DaisyUIComponents.Table
      import <%= if not @dev do @web_namespace <> "." end %>DaisyUIComponents.TextInput
      import <%= if not @dev do @web_namespace <> "." end %>DaisyUIComponents.Textarea
      import <%= if not @dev do @web_namespace <> "." end %>DaisyUIComponents.Toggle
      import <%= if not @dev do @web_namespace <> "." end %>DaisyUIComponents.Tooltip
    end
  end
end
