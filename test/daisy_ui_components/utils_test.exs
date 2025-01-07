defmodule DaisyUIComponents.UtilsTest do
  use ExUnit.Case

  import DaisyUIComponents.Utils

  describe "classes/1" do
    test "trim classes" do
      assert "1 2" == classes(["1  ", " 2  "])
    end

    test "nested class lists classes" do
      assert "primary extra-classes another-class 1" ==
               classes(["primary", ["extra-classes", "another-class "], 1])
    end

    test "nil classes" do
      assert "primary secondary" ==
               classes([nil, "primary", ["secondary", nil]])
    end
  end

  test "render?" do
    assert render?(:field)
    refute render?(nil)
    refute render?("")
    refute render?([])
    assert render?(["field", nil, []])
    refute render?(["", nil, []])
    refute render?(["", nil])
  end
end
