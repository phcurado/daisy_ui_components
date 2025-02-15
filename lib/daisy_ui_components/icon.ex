defmodule DaisyUIComponents.Icon do
  @moduledoc """
  Renders hero icons
  Code extracted from [Phoenix Core Components](https://github.com/phoenixframework/phoenix/blob/main/installer/templates/phx_web/components/core_components.ex).
  """

  use DaisyUIComponents, :component

  @doc """
  Renders a [Hero Icon](https://heroicons.com).

  Hero icons come in three styles – outline, solid, and mini.
  By default, the outline style is used, but solid and mini may
  be applied by using the `-solid` and `-mini` suffix.

  You can customize the size and colors of the icons by setting
  width, height, and background color classes.

  Icons are extracted from your `assets/vendor/heroicons` directory and bundled
  within your compiled app.css by the plugin in your `assets/tailwind.config.js`.

  ## Examples

      <.icon name="hero-x-mark-solid" />
      <.icon name="hero-arrow-path" class="ml-1 w-3 h-3 animate-spin" />
  """
  attr :id, :any, default: nil
  attr :name, :string, required: true
  attr :class, :string, default: nil

  def icon(%{name: "hero-" <> _} = assigns) do
    ~H"""
    <span id={@id} class={[@name, @class]} />
    """
  end
end
