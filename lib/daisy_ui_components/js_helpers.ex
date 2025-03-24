defmodule DaisyUIComponents.JSHelpers do
  @moduledoc """
  Common JS functions from [Phoenix Core Components](https://github.com/phoenixframework/phoenix/blob/main/installer/templates/phx_web/components/core_components.ex).
  """

  alias Phoenix.LiveView.JS

  @doc """

  Shows the specified element with a smooth transition effect.

  ## Parameters

  - js - a map of JavaScript settings to apply.
  - selector - the CSS selector of the element to be shown.
  ## Description
  Applies a transition effect to the selected element, altering its opacity and position over a specified duration.

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

  Hides an element specified by the selector with a transition effect.

  ## Parameters

  - js - a map representing JavaScript state (default is an empty map).
  - selector - a string or selector representing the target element to hide.
  ## Description
   Executes a hide action on the specified element with a transition effect.

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
