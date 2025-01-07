defmodule DaisyUIComponents.Utils do
  @moduledoc false

  alias Phoenix.LiveView.JS

  @colors ~w(primary secondary accent info success warning error)
  @directions ~w(horizontal vertical)
  @sizes ~w(xs sm md lg)

  def colors, do: @colors
  def directions, do: @directions
  def sizes, do: @sizes

  @spec classes(list() | nil | binary() | any()) :: binary()
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

  def move_attr_to_rest(assigns, props) when is_list(props) do
    Enum.reduce(props, assigns, fn prop, acc ->
      move_attr_to_rest(acc, prop)
    end)
  end

  def move_attr_to_rest(%{rest: rest} = assigns, prop) do
    value = Map.get(assigns, prop)
    rest = Map.put(rest, prop, value)

    {_value, assigns} = Map.pop(assigns, prop)
    %{assigns | rest: rest}
  end

  def join_classes_with_rest(%{rest: rest} = assigns, classes) when is_list(classes) do
    classes =
      join_classes(classes, rest[:class])
      |> parse_classes()

    rest = Map.put(rest, :class, classes)

    %{assigns | rest: rest}
  end

  def join_classes(class_1, class_2) do
    resolve_classes(class_1) ++ resolve_classes(class_2)
  end

  def join_classes(classes) when is_list(classes) do
    classes
    |> Enum.reject(&(!&1))
    |> Enum.join(" ")
    |> String.trim()
  end

  defp resolve_classes(classes) when is_list(classes), do: classes
  defp resolve_classes(nil), do: []
  defp resolve_classes(classes), do: [classes]

  defp parse_classes(classes) when is_list(classes) do
    filtered_classes = Enum.filter(classes, &(&1 != nil))

    if Enum.empty?(filtered_classes) do
      nil
    else
      filtered_classes
    end
  end

  def render?(opts) when is_list(opts) do
    Enum.any?(opts, &render?/1)
  end

  def render?(value) do
    !(value in [nil, "", []])
  end

  def maybe_add_class(true, class), do: class
  def maybe_add_class(_false, _class), do: nil

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

  def show(js \\ %JS{}, selector) do
    JS.remove_class(js, "hidden",
      to: selector,
      transition:
        {"transition-all transform ease-out duration-300",
         "opacity-0 translate-y-4 sm:translate-y-0 sm:scale-95",
         "opacity-100 translate-y-0 sm:scale-100"}
    )
  end

  def hide(js \\ %JS{}, selector) do
    JS.add_class(js, "hidden",
      to: selector,
      time: 200,
      transition:
        {"transition-all transform ease-in duration-200",
         "opacity-100 translate-y-0 sm:scale-100",
         "opacity-0 translate-y-4 sm:translate-y-0 sm:scale-95"}
    )
  end
end
