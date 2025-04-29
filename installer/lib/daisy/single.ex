defmodule Daisy.New.Single do
  @moduledoc false
  use Daisy.New.Generator
  alias Daisy.New.{Project}

  template(:new, [
    {:eex, :web, "daisy_ui_components.ex": "lib/:lib_web_name/daisy_ui_components.ex"},
    {:eex, :web, "components/alert.ex": "lib/:lib_web_name/daisy_ui_components/alert.ex"},
    {:eex, :web, "components/avatar.ex": "lib/:lib_web_name/daisy_ui_components/avatar.ex"},
    {:eex, :web, "components/back.ex": "lib/:lib_web_name/daisy_ui_components/back.ex"},
    {:eex, :web, "components/badge.ex": "lib/:lib_web_name/daisy_ui_components/badge.ex"},
    {:eex, :web, "components/breadcrumbs.ex": "lib/:lib_web_name/daisy_ui_components/breadcrumbs.ex"},
    {:eex, :web, "components/button.ex": "lib/:lib_web_name/daisy_ui_components/button.ex"},
    {:eex, :web, "components/card.ex": "lib/:lib_web_name/daisy_ui_components/card.ex"},
    {:eex, :web, "components/checkbox.ex": "lib/:lib_web_name/daisy_ui_components/checkbox.ex"},
    {:eex, :web, "components/drawer.ex": "lib/:lib_web_name/daisy_ui_components/drawer.ex"},
    {:eex, :web, "components/dropdown.ex": "lib/:lib_web_name/daisy_ui_components/dropdown.ex"},
    {:eex, :web, "components/fieldset.ex": "lib/:lib_web_name/daisy_ui_components/fieldset.ex"},
    {:eex, :web, "components/footer.ex": "lib/:lib_web_name/daisy_ui_components/footer.ex"},
    {:eex, :web, "components/form.ex": "lib/:lib_web_name/daisy_ui_components/form.ex"},
    {:eex, :web, "components/header.ex": "lib/:lib_web_name/daisy_ui_components/header.ex"},
    {:eex, :web, "components/hero.ex": "lib/:lib_web_name/daisy_ui_components/hero.ex"},
    {:eex, :web, "components/icon.ex": "lib/:lib_web_name/daisy_ui_components/icon.ex"},
    {:eex, :web, "components/indicator.ex": "lib/:lib_web_name/daisy_ui_components/indicator.ex"},
    {:eex, :web, "components/input.ex": "lib/:lib_web_name/daisy_ui_components/input.ex"},
    {:eex, :web, "components/join.ex": "lib/:lib_web_name/daisy_ui_components/join.ex"},
    {:eex, :web, "components/js_helpers.ex": "lib/:lib_web_name/daisy_ui_components/js_helpers.ex"},
    {:eex, :web, "components/label.ex": "lib/:lib_web_name/daisy_ui_components/label.ex"},
    {:eex, :web, "components/list.ex": "lib/:lib_web_name/daisy_ui_components/list.ex"},
    {:eex, :web, "components/loading.ex": "lib/:lib_web_name/daisy_ui_components/loading.ex"},
    {:eex, :web, "components/menu.ex": "lib/:lib_web_name/daisy_ui_components/menu.ex"},
    {:eex, :web, "components/modal.ex": "lib/:lib_web_name/daisy_ui_components/modal.ex"},
    {:eex, :web, "components/navbar.ex": "lib/:lib_web_name/daisy_ui_components/navbar.ex"},
    {:eex, :web, "components/pagination.ex": "lib/:lib_web_name/daisy_ui_components/pagination.ex"},
    {:eex, :web, "components/progress.ex": "lib/:lib_web_name/daisy_ui_components/progress.ex"},
    {:eex, :web, "components/radio.ex": "lib/:lib_web_name/daisy_ui_components/radio.ex"},
    {:eex, :web, "components/range.ex": "lib/:lib_web_name/daisy_ui_components/range.ex"},
    {:eex, :web, "components/select.ex": "lib/:lib_web_name/daisy_ui_components/select.ex"},
    {:eex, :web, "components/stat.ex": "lib/:lib_web_name/daisy_ui_components/stat.ex"},
    {:eex, :web, "components/swap.ex": "lib/:lib_web_name/daisy_ui_components/swap.ex"},
    {:eex, :web, "components/table.ex": "lib/:lib_web_name/daisy_ui_components/table.ex"},
    {:eex, :web, "components/text_input.ex": "lib/:lib_web_name/daisy_ui_components/text_input.ex"},
    {:eex, :web, "components/textarea.ex": "lib/:lib_web_name/daisy_ui_components/textarea.ex"},
    {:eex, :web, "components/toggle.ex": "lib/:lib_web_name/daisy_ui_components/toggle.ex"},
    {:eex, :web, "components/tooltip.ex": "lib/:lib_web_name/daisy_ui_components/tooltip.ex"},
    {:eex, :web, "components/utils.ex": "lib/:lib_web_name/daisy_ui_components/utils.ex"},
  ])

  def prepare_project(%Project{app: app, base_path: base_path} = project) when not is_nil(app) do
    if in_umbrella?(base_path) do
      %{project | in_umbrella?: true, project_path: Path.dirname(Path.dirname(base_path))}
    else
      %{project | in_umbrella?: false, project_path: base_path}
    end
    |> put_app()
    |> put_root_app()
    |> put_web_app()
  end

  defp put_app(%Project{base_path: base_path} = project) do
    %{project | app_path: base_path}
  end

  defp put_root_app(%Project{app: app, opts: opts} = project) do
    %{
      project
      | root_app: app,
        root_mod: Module.concat([opts[:module] || Macro.camelize(app)])
    }
  end

  defp put_web_app(%Project{app: app} = project) do
    %{
      project
      | web_app: app,
        lib_web_name: "#{app}_web",
        web_namespace: Module.concat(["#{project.root_mod}Web"]),
        web_path: project.base_path
    }
  end

  def generate(%Project{} = project) do
    copy_from(project, __MODULE__, :new)
    project
  end
end
