defmodule DaisyUIComponents.SelectTest do
  use DaisyUIComponents.ComponentCase

  import Phoenix.Component
  import DaisyUIComponents.Select

  alias DaisyUIComponents.Utils

  test "simple select with options" do
    assigns = %{}

    ~H"""
    <.select>
      <option value="">select user</option>
      <option selected value="admin">admin</option>
      <option value="admin">admin</option>
      <option value="super_admin">Super Admin</option>
    </.select>
    """
    |> parse_component()
    |> assert_component("select")
    |> select_element("option", fn [option1, option2, option3, option4] ->
      option1
      |> assert_component("option")
      |> assert_attribute("value", "")
      |> assert_text("select user")

      option2
      |> assert_component("option")
      |> assert_attribute("value", "admin")
      |> assert_attribute("selected", "selected")
      |> assert_text("admin")

      option3
      |> assert_component("option")
      |> assert_attribute("value", "admin")
      |> assert_text("admin")

      option4
      |> assert_component("option")
      |> assert_attribute("value", "super_admin")
      |> assert_text("Super Admin")
    end)
  end

  test "select colors" do
    for color <- Utils.colors() do
      assigns = %{color: color}

      ~H"""
      <.select color={@color} />
      """
      |> parse_component()
      |> assert_component("select")
      |> assert_class("select select-#{color}")
    end
  end

  test "select sizes" do
    for size <- Utils.sizes() do
      assigns = %{size: size}

      ~H"""
      <.select size={@size} />
      """
      |> parse_component()
      |> assert_component("select")
      |> assert_class("select select-#{size}")
    end
  end

  test "select boolean assigns" do
    for boolean_assign <- ~w(ghost)a do
      assigns = %{boolean_assign => true}

      ~H"""
      <.select {assigns} />
      """
      |> parse_component()
      |> assert_component("select")
      |> assert_class("select select-#{to_string(boolean_assign)}")
    end
  end
end
