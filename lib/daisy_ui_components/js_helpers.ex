defmodule DaisyUIComponents.JSHelpers do
  @moduledoc """
  Common JS functions from [Phoenix Core Components](https://github.com/phoenixframework/phoenix/blob/main/installer/templates/phx_web/components/core_components.ex).
  """

  alias Phoenix.LiveView.JS

  @doc """

  Returns a JavaScript operation that shows an element with a specified transition effect.

  ## Parameters

  - js - a map that represents the current JavaScript state.
  - selector - a string that specifies the CSS selector of the element to show.
  ## Description
  Utilizes the JS.show function to display an element with a defined transition timing and effects.

  """

  # show and hide functions from phoenix CoreComponents
  def show(js \\ %JS{}, selector) do
    JS.show(js,
      to: selector,
      time: 300,
      transition:
        {"transition-all ease-out duration-300",
         "opacity-0 translate-y-4 sm:translate-y-0 sm:scale-95",
         "opacity-100 translate-y-0 sm:scale-100"}
    )
  end

  @doc """

  Returns a JS object that hides a specified element with a transition effect.

  ## Parameters

  - js - an optional JavaScript object used for chaining (default: %JS{}).
  - selector - a string that specifies the CSS selector of the element to hide.
  ## Description
   Applies a transitioning style to the targeted element, making it fade and move when it is hidden.

  """
  def hide(js \\ %JS{}, selector) do
    JS.hide(js,
      to: selector,
      time: 200,
      transition:
        {"transition-all ease-in duration-200", "opacity-100 translate-y-0 sm:scale-100",
         "opacity-0 translate-y-4 sm:translate-y-0 sm:scale-95"}
    )
  end
end
