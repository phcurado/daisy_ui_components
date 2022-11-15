defmodule LiveDaisyuiComponents.Utils do
  @moduledoc """
  Utils function for components
  """

  @colors ~w(primary secondary accent info success warning error)
  @sizes ~w(xs sm md lg)

  def colors, do: @colors
  def sizes, do: @sizes

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
    classes = classes ++ [rest[:class]]
    classes = join_classes(classes)

    rest = Map.put(rest, :class, classes)

    %{assigns | rest: rest}
  end

  def join_classes(classes) when is_list(classes) do
    classes
    |> Enum.reject(&(!&1))
    |> Enum.join(" ")
    |> String.trim()
  end

  def render?(opts) when is_list(opts) do
    Enum.any?(opts, &render?/1)
  end

  def render?(value) do
    !(value in [nil, "", []])
  end

  def add_class_from_size(size, prefix) when size in @sizes, do: "#{prefix}-#{size}"
  def add_class_from_size(_size, _prefix), do: nil

  def add_class_from_color(color, prefix) when color in @colors, do: "#{prefix}-#{color}"
  def add_class_from_color(_color, _prefix), do: nil

  def add_class_from_bool(true, class), do: class
  def add_class_from_bool(_false, _class), do: nil
end
