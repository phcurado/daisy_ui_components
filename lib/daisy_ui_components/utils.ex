defmodule DaisyUIComponents.Utils do
  @moduledoc false

  @colors ~w(primary secondary accent info success warning error)
  @directions ~w(top bottom left right)
  @sizes ~w(xs sm md lg)

  @doc """

  Returns the colors associated with the current object's state.

  ## Parameters

  - None
  ## Description
  Retrieves the list of colors stored in the object.

  """
  def colors, do: @colors

  @doc """

  Returns the directions based on the specified criteria.

  ## Parameters

  - do - specifies the action to be performed for generating directions.
  ## Description
  Retrieves and processes directions according to the given parameters.

  """
  def directions, do: @directions

  @doc """

  Returns the sizes associated with a particular do action.

  ## Parameters

  - do - specifies the action for which sizes are to be retrieved.
  ## Description
   Retrieves size details based on the given action.

  """
  def sizes, do: @sizes

  @spec classes(list() | nil | binary() | any()) :: binary()
  @doc """

  Returns a string that represents a concatenation of class names from the provided list, formatted and trimmed.

  ## Parameters

  - classes - a list of class names, which can be strings or other types that can be converted to strings.
  ## Description
  Iterates through the provided list, processes each class name, and combines them into a single formatted string.

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

  Returns true if any of the options in the list are valid for rendering.

  ## Parameters

  - opts - a list of options to be checked for rendering validity.

  ## Description
  Checks each option in the list to determine if at least one is valid for rendering.

  """
  def render?(opts) when is_list(opts) do
    Enum.any?(opts, &render?/1)
  end

  def render?(value) do
    !(value in [nil, "", []])
  end

  @doc """

  Returns the class if true, otherwise returns nil.

  ## Parameters

  - true - a boolean indicating whether to return the class.
  - class - the class to return if the first parameter is true.
    
  ## Description
   Evaluates the first parameter and conditionally returns the class or nil.

  """
  def maybe_add_class(true, class), do: class
  def maybe_add_class(_false, _class), do: nil

  @doc """

  Returns the translated message based on the provided parameters.

  ## Parameters

  - params - a map containing the message and optional translation options.
  - msg - the message string to be translated.

  ## Description
  Utilizes a translation function defined in the application's environment configuration, or returns the original message if no translation function is set.

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
