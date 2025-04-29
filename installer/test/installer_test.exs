defmodule InstallerTest do
  use ExUnit.Case
  doctest Installer

  test "greets the world" do
    assert Installer.hello() == :world
  end
end
