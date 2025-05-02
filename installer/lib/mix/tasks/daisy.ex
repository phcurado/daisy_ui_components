defmodule Mix.Tasks.Daisy do
  @moduledoc """
  Exports the Daisy UI components to your Phoenix project
  """
  use Mix.Task
  alias Daisy.New.{Project, Generator, Single}

  @version Mix.Project.config()[:version]
  @shortdoc "Exports the Daisy UI Components v#{@version} into your application"

  @reserved_app_names []
  @switches [
    dev: :boolean,
    module: :string,
    web_module: :string,
    umbrella: :boolean,
    help: :boolean,
    verbose: :boolean,
    from_elixir_install: :boolean,
    version_check: :boolean
  ]
  @impl true
  def run([version]) when version in ~w(-v --version) do
    Mix.shell().info("Daisy UI Components installer v#{@version}")
  end

  def run(argv) do
    elixir_version_check!()

    {opts, argv} = OptionParser.parse!(argv, strict: @switches)

    result =
      case {opts, argv} do
        {[help: true], _argv} ->
          Mix.Tasks.Help.run(["daisy"])

        {opts, argv} ->
          opts = [{:components, argv} | opts]
          generate(Single, opts)
      end

    result
  end

  def generate(generator, opts) do
    Project.new(opts)
    |> generator.prepare_project()
    |> Generator.put_binding()
    |> validate_project(:base_path)
    |> generator.generate()
  end

  defp validate_project(%Project{opts: opts} = project, path) do
    check_app_name!(project.app, !!opts[:app])
    check_directory_existence!(Map.fetch!(project, path))
    check_module_name_validity!(project.root_mod)
    check_module_name_availability!(project.root_mod)

    project
  end

  defp elixir_version_check! do
    unless Version.match?(System.version(), "~> 1.15") do
      Mix.raise(
        "Daisy UI v#{@version} requires at least Elixir v1.15\n " <>
          "You have #{System.version()}. Please update accordingly"
      )
    end
  end

  defp check_app_name!(name, from_app_flag) do
    with :ok <- validate_not_reserved(name),
         :ok <- validate_app_name_format(name, from_app_flag) do
      :ok
    end
  end

  defp validate_not_reserved(name) when name in @reserved_app_names do
    Mix.raise("Application name cannot be #{inspect(name)} as it is reserved")
  end

  defp validate_not_reserved(_name), do: :ok

  defp validate_app_name_format(name, from_app_flag) do
    if name =~ ~r/^[a-z][a-z0-9_]*$/ do
      :ok
    else
      extra =
        if !from_app_flag do
          ". The application name is inferred from the path, if you'd like to " <>
            "explicitly name the application then use the `--app APP` option."
        else
          ""
        end

      Mix.raise(
        "Application name must start with a letter and have only lowercase " <>
          "letters, numbers and underscore, got: #{inspect(name)}" <> extra
      )
    end
  end

  defp check_directory_existence!(path) do
    if File.dir?(path) and
         not Mix.shell().yes?(
           "The directory #{path} already exists. Are you sure you want to continue?"
         ) do
      Mix.raise("Please select another directory for installation.")
    end
  end

  defp check_module_name_validity!(name) do
    unless inspect(name) =~ Regex.recompile!(~r/^[A-Z]\w*(\.[A-Z]\w*)*$/) do
      Mix.raise(
        "Module name must be a valid Elixir alias (for example: Foo.Bar), got: #{inspect(name)}"
      )
    end
  end

  defp check_module_name_availability!(name) do
    [name]
    |> Module.concat()
    |> Module.split()
    |> Enum.reduce([], fn name, acc ->
      mod = Module.concat([Elixir, name | acc])

      if Code.ensure_loaded?(mod) do
        Mix.raise("Module name #{inspect(mod)} is already taken, please choose another name")
      else
        [name | acc]
      end
    end)
  end
end
