defmodule Mix.Tasks.DaisyUiComponents.Install.Docs do
  @moduledoc false

  @spec short_doc() :: String.t()
  def short_doc do
    "A short description of your task"
  end

  @spec example() :: String.t()
  def example do
    "mix daisy_ui_components.install --example arg"
  end

  @spec long_doc() :: String.t()
  def long_doc do
    """
    #{short_doc()}

    Longer explanation of your task

    ## Example

    ```sh
    #{example()}
    ```

    ## Options

    * `--example-option` or `-e` - Docs for your option
    """
  end
end

if Code.ensure_loaded?(Igniter) do
  defmodule Mix.Tasks.DaisyUiComponents.Install do
    @shortdoc "#{__MODULE__.Docs.short_doc()}"

    @moduledoc __MODULE__.Docs.long_doc()

    use Igniter.Mix.Task

    @impl Igniter.Mix.Task
    def info(_argv, _composing_task) do
      %Igniter.Mix.Task.Info{
        # Groups allow for overlapping arguments for tasks by the same author
        # See the generators guide for more.
        group: :daisy_ui_components,
        # *other* dependencies to add
        # i.e `{:foo, "~> 2.0"}`
        adds_deps: [],
        # *other* dependencies to add and call their associated installers, if they exist
        # i.e `{:foo, "~> 2.0"}`
        installs: [],
        # An example invocation
        example: __MODULE__.Docs.example(),
        # A list of environments that this should be installed in.
        only: nil,
        # a list of positional arguments, i.e `[:file]`
        positional: [],
        # Other tasks your task composes using `Igniter.compose_task`, passing in the CLI argv
        # This ensures your option schema includes options from nested tasks
        composes: [],
        # `OptionParser` schema
        schema: [],
        # Default values for the options in the `schema`
        defaults: [],
        # CLI aliases
        aliases: [],
        # A list of options in the schema that are required
        required: []
      }
    end

    @impl Igniter.Mix.Task
    def igniter(igniter) do
      web_module = Igniter.Libs.Phoenix.web_module(igniter)

      igniter
      |> add_config(web_module)
      |> add_source_css()
      |> add_daisy_in_web_module(web_module)
      |> Igniter.add_warning("mix daisy_ui_components.install is not yet implemented")
    end

    defp add_config(igniter, web_module) do
      # [_elixir | core_components_module_list] =
      #   Module.concat(web_module, CoreComponents)
      #   |> to_string()
      #   |> String.split(".")
      #
      # core_components_module = Enum.join(core_components_module_list, ".")

      core_components_module = Module.concat(web_module, CoreComponents)

      Igniter.Project.Config.configure(
        igniter,
        "config.exs",
        :daisy_ui_components,
        [:translate_function],
        {:code,
         Sourceror.parse_string!("""
         &#{inspect(core_components_module)}.translate_error/1
         """)}
      )
    end

    defp add_source_css(igniter) do
      css = "./assets/css/app.css"
      content = File.read!(css)

      File.write!(
        css,
        """
        @source "../../deps/daisy_ui_components";

        #{content}
        """
      )

      igniter
    end

    defp add_daisy_in_web_module(igniter, web_module) do
      # Igniter.Project.Module.find_and_update_module!(igniter, web_module, fn zipper ->
      #   zipper
      #   # Sourceror.Zipper.traverse(zipper, fn zip ->
      #   #   # %Sourceror.Zipper{node: {:quote, _, [[{_, {:__block__, _, _args}}]]} = zip} ->
      #   #     # dbg(node)
      #   #     # node
      #   #     zip
      #   #
      #   #   # cur_zipper ->
      #   #   #   cur_zipper
      #   # end)
      # end)

      igniter
    end
  end
else
  defmodule Mix.Tasks.DaisyUiComponents.Install do
    @shortdoc "#{__MODULE__.Docs.short_doc()} | Install `igniter` to use"

    @moduledoc __MODULE__.Docs.long_doc()

    use Mix.Task

    @impl Mix.Task
    def run(_argv) do
      Mix.shell().error("""
      The task 'daisy_ui_components.install' requires igniter. Please install igniter and try again.

      For more information, see: https://hexdocs.pm/igniter/readme.html#installation
      """)

      exit({:shutdown, 1})
    end
  end
end
