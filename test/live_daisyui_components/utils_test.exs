defmodule LiveDaisyuiComponents.UtilsTest do
  use ExUnit.Case

  import LiveDaisyuiComponents.Utils

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
