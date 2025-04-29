
defmodule Daisy.New.Generator do
  @moduledoc false
  import Mix.Generator
  alias Daisy.New.{Project}

  @callback prepare_project(Project.t()) :: Project.t()
  @callback generate(Project.t()) :: Project.t()

  defmacro __using__(_env) do
    quote do
      @behaviour unquote(__MODULE__)
      import Mix.Generator
      import unquote(__MODULE__)
      Module.register_attribute(__MODULE__, :templates, accumulate: true)
      @before_compile unquote(__MODULE__)
    end
  end

  defmacro __before_compile__(env) do
    root = Path.expand("../../templates", __DIR__)

    templates_ast =
      for {name, mappings} <- Module.get_attribute(env.module, :templates) do
        for {format, _proj_location, files} <- mappings,
            format != :keep,
            {source, _target} <- files,
            source = to_string(source) do
          path = Path.join(root, source)

          if format in [:config, :prod_config, :eex] do
            compiled = EEx.compile_file(path)

            quote do
              @external_resource unquote(path)
              @file unquote(path)
              def render(unquote(name), unquote(source), var!(assigns))
                  when is_list(var!(assigns)) do
                unquote(compiled)
              end
            end
          else
            quote do
              @external_resource unquote(path)
              def render(unquote(name), unquote(source), _assigns), do: unquote(File.read!(path))
            end
          end
        end
      end

    quote do
      unquote(templates_ast)
      def template_files(name), do: Keyword.fetch!(@templates, name)
    end
  end

  defmacro template(name, mappings) do
    quote do
      @templates {unquote(name), unquote(mappings)}
    end
  end

  def copy_from(%Project{} = project, mod, name) when is_atom(name) do
    mapping = mod.template_files(name)

    for {format, project_location, files} <- mapping,
        {source, target_path} <- files,
        source = to_string(source) do
      project |> dbg()
      project_location |> dbg()
      target_path |> dbg()
      target = Project.join_path(project, project_location, target_path)

      case format do
        :keep ->
          File.mkdir_p!(target)

        :text ->
          create_file(target, mod.render(name, source, project.binding))

        :config ->
          contents = mod.render(name, source, project.binding)
          config_inject(Path.dirname(target), Path.basename(target), contents)

        :prod_config ->
          contents = mod.render(name, source, project.binding)
          prod_only_config_inject(Path.dirname(target), Path.basename(target), contents)

        :eex ->
          contents = mod.render(name, source, project.binding)
          create_file(target, contents)
      end
    end
  end

  def config_inject(path, file, to_inject) do
    file = Path.join(path, file)

    contents =
      case File.read(file) do
        {:ok, bin} -> bin
        {:error, _} -> "import Config\n"
      end

    case :binary.split(contents, "import Config") do
      [left, right] ->
        write_formatted!(file, [left, to_inject, right])

      [_] ->
        Mix.raise(~s[Could not find "import Config" in #{inspect(file)}])
    end
  end

  def prod_only_config_inject(path, file, to_inject) do
    file = Path.join(path, file)

    contents =
      case File.read(file) do
        {:ok, bin} ->
          bin

        {:error, _} ->
          """
          import Config

          if config_env() == :prod do
          end
          """
      end

    case :binary.split(contents, "if config_env() == :prod do") do
      [left, right] ->
        write_formatted!(file, [left, "if config_env() == :prod do\n", to_inject, right])

      [_] ->
        Mix.raise(~s[Could not find "if config_env() == :prod do" in #{inspect(file)}])
    end
  end

  defp write_formatted!(file, contents) do
    formatted = contents |> IO.iodata_to_binary() |> Code.format_string!()
    File.mkdir_p!(Path.dirname(file))
    File.write!(file, [formatted, ?\n])
  end

  def inject_umbrella_config_defaults(project) do
    unless File.exists?(Project.join_path(project, :project, "config/dev.exs")) do
      path = Project.join_path(project, :project, "config/config.exs")

      extra =
        Daisy.New.Umbrella.render(:new, "phx_umbrella/config/extra_config.exs", project.binding)

      File.write(path, [File.read!(path), extra])
    end
  end

  def in_umbrella?(app_path) do
    umbrella = Path.expand(Path.join([app_path, "..", ".."]))
    mix_path = Path.join(umbrella, "mix.exs")
    apps_path = Path.join(umbrella, "apps")

    File.exists?(mix_path) && File.exists?(apps_path)
  end

  def put_binding(%Project{opts: opts} = project) do

    dev = Keyword.get(opts, :dev, false)
    from_elixir_install = Keyword.get(opts, :from_elixir_install, false)

    binding = [
      app_name: project.app,
      app_module: inspect(project.app_mod),
      root_app_name: project.root_app,
      root_app_module: inspect(project.root_mod),
      lib_web_name: project.lib_web_name,
      web_app_name: project.web_app,
      web_namespace: inspect(project.web_namespace),
      in_umbrella: project.in_umbrella?,
      namespaced?: namespaced?(project),
      dev: dev,
      from_elixir_install: from_elixir_install,
      elixir_install_otp_bin_path: from_elixir_install && elixir_install_otp_bin_path(),
      elixir_install_bin_path: from_elixir_install && elixir_install_bin_path(),
    ]

    %{project | binding: binding}
  end

  def elixir_install_otp_bin_path do
    "erl"
    |> System.find_executable()
    |> Path.split()
    |> Enum.drop(-1)
    |> Path.join()
    |> Path.relative_to(System.user_home())
  end

  def elixir_install_bin_path do
    "elixir"
    |> System.find_executable()
    |> Path.split()
    |> Enum.drop(-1)
    |> Path.join()
    |> Path.relative_to(System.user_home())
  end

  defp namespaced?(project) do
    Macro.camelize(project.app) != inspect(project.app_mod)
  end
end
