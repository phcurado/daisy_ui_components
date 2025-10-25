defmodule Mix.Tasks.DaisyUiComponents.InstallTest do
  use ExUnit.Case, async: true
  import Igniter.Test

  test "it warns when run" do
    # generate a test project
    test_project()
    # run our task
    |> Igniter.compose_task("daisy_ui_components.install", [])
    # see tools in `Igniter.Test` for available assertions & helpers
    |> assert_has_warning("mix daisy_ui_components.install is not yet implemented")
  end
end
