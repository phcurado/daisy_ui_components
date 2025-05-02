defmodule Daisy.New.Project do
  @moduledoc false
  alias Daisy.New.Project

  defstruct base_path: nil,
            app: nil,
            app_mod: nil,
            app_path: nil,
            lib_web_name: nil,
            root_app: nil,
            root_mod: nil,
            project_path: nil,
            web_app: nil,
            web_namespace: nil,
            web_path: nil,
            opts: :unset,
            in_umbrella?: false,
            components: [],
            binding: [],
            cached_build_path: nil,
            generators: [timestamp_type: :utc_datetime]

  def new(opts) do
    config = Mix.Project.config()
    app = config[:app] |> Atom.to_string()
    project_path = Path.expand(".")
    app_mod = Module.concat([opts[:module] || Macro.camelize(app)])
    components = opts[:components] || []

    %Project{
      base_path: project_path,
      app: app,
      app_mod: app_mod,
      root_app: app,
      root_mod: app_mod,
      components: components,
      opts: opts
    }
  end

  def replace?(%Project{opts: opts}) do
    Keyword.get(opts, :replace, false)
  end

  def dev?(%Project{opts: opts}) do
    Keyword.get(opts, :dev, false)
  end

  def join_path(%Project{} = project, location, path)
      when location in [:project, :app, :web] do
    project
    |> Map.fetch!(:"#{location}_path")
    |> Path.join(path)
    |> expand_path_with_bindings(project)
  end

  defp expand_path_with_bindings(path, %Project{} = project) do
    Regex.replace(Regex.recompile!(~r/:[a-zA-Z0-9_]+/), path, fn ":" <> key, _ ->
      project |> Map.fetch!(:"#{key}") |> to_string()
    end)
  end
end
