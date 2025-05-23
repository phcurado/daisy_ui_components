[
  plugins: [Phoenix.LiveView.HTMLFormatter],
  import_deps: [:phoenix],
  inputs:
    Enum.flat_map(
      ["*.{heex,ex,exs}", "{config,lib,test}/**/*.{heex,ex,exs}"],
      &Path.wildcard(&1, match_dot: true)
    ) -- ["lib/daisy_ui_components/form.ex", "lib/daisy_ui_components/input.ex"]
]
