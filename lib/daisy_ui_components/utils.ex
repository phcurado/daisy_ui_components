defmodule DaisyUIComponents.Utils do
  @moduledoc false

  @colors ~w(primary secondary accent info success warning error)
  @directions ~w(top bottom left right)
  @sizes ~w(xs sm md lg xl)

  @doc """

  Returns the list of colors available.

  """
  def colors, do: @colors

  @doc """

  Returns the directions available.

  """
  def directions, do: @directions

  @doc """

  Returns the sizes available.

  """
  def sizes, do: @sizes

  @spec classes(list() | nil | binary() | any()) :: binary()
  @doc """

  Returns a string that represents a list of processed class names.

  ## Parameters

  - classes - a list of class names, which can be a string or a list of strings.

  ## Description
  Processes the input list of classes by trimming, converting to strings, and joining them into a single space-separated string.

  """
  def classes(classes) when is_list(classes) do
    Enum.reduce(classes, [], fn class, acc ->
      [classes(class) | acc]
    end)
    |> Enum.reverse()
    |> Enum.reject(&(!&1))
    |> Enum.join(" ")
  end

  def classes(nil), do: nil
  def classes(class) when is_binary(class), do: String.trim(class)
  def classes(class), do: to_string(class)

  @doc """

  Returns true if any of the provided options are valid for rendering.

  ## Parameters

  - opts - a list of options to be checked for rendering validity.
  ## Description
  Evaluates whether any item in the list is a valid render option.
  An option is valid if it is not `nil`, empty string or empty list. 

  """
  def render?(opts) when is_list(opts) do
    Enum.any?(opts, &render?/1)
  end

  def render?(value) do
    !(value in [nil, "", []])
  end

  @doc """

  Returns the specified class if the condition is true, otherwise returns nil.

  ## Parameters

  - boolean or string "true" - a value indicating whether to include the specified class.
  - class - the class to potentially add.

  ## Description
  Evaluates the condition and decides whether to return the class or nil.

  """
  def maybe_add_class("true", class), do: class
  def maybe_add_class(true, class), do: class
  def maybe_add_class(_false, _class), do: nil

  @doc """

  Returns the translated message based on the provided parameters.

  ## Parameters

  - {msg, _opts} = params - The message string that needs to be translated and some opts ignored.

  ## Description
  Retrieves the appropriate translation function from the application environment and performs the translation, or returns the original message if none is found.

  """
  def translate({msg, _opts} = params) do
    if translate_function = Application.get_env(:daisy_ui_components, :translate_function) do
      translate_function.(params)
    else
      msg
    end
  end

  def translate(msg) do
    if translate_function = Application.get_env(:daisy_ui_components, :translate_function) do
      translate_function.({msg, []})
    else
      msg
    end
  end

  # def show(js \\ %JS{}, selector) do
  #   JS.remove_class(js, "hidden",
  #     to: selector,
  #     transition:
  #       {"transition-all transform ease-out duration-300",
  #        "opacity-0 translate-y-4 sm:translate-y-0 sm:scale-95",
  #        "opacity-100 translate-y-0 sm:scale-100"}
  #   )
  # end
  #
  # def hide(js \\ %JS{}, selector) do
  #   JS.add_class(js, "hidden",
  #     to: selector,
  #     time: 200,
  #     transition:
  #       {"transition-all transform ease-in duration-200",
  #        "opacity-100 translate-y-0 sm:scale-100",
  #        "opacity-0 translate-y-4 sm:translate-y-0 sm:scale-95"}
  #   )
  # end
end
