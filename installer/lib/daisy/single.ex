defmodule Daisy.New.Single do
  @moduledoc false
  use Daisy.New.Generator
  alias Daisy.New.Project

  @all_components [
    "components/js_helpers.ex": "lib/daisy_ui_components/js_helpers.ex",
    "components/utils.ex": "lib/daisy_ui_components/utils.ex",
    "daisy_ui_components.ex": "lib/daisy_ui_components.ex",
    "components/accordion.ex": "lib/daisy_ui_components/accordion.ex",
    "components/alert.ex": "lib/daisy_ui_components/alert.ex",
    "components/avatar.ex": "lib/daisy_ui_components/avatar.ex",
    "components/back.ex": "lib/daisy_ui_components/back.ex",
    "components/badge.ex": "lib/daisy_ui_components/badge.ex",
    "components/breadcrumbs.ex": "lib/daisy_ui_components/breadcrumbs.ex",
    "components/button.ex": "lib/daisy_ui_components/button.ex",
    "components/card.ex": "lib/daisy_ui_components/card.ex",
    "components/checkbox.ex": "lib/daisy_ui_components/checkbox.ex",
    "components/collapse.ex": "lib/daisy_ui_components/collapse.ex",
    "components/drawer.ex": "lib/daisy_ui_components/drawer.ex",
    "components/dropdown.ex": "lib/daisy_ui_components/dropdown.ex",
    "components/fieldset.ex": "lib/daisy_ui_components/fieldset.ex",
    "components/flash.ex": "lib/daisy_ui_components/flash.ex",
    "components/footer.ex": "lib/daisy_ui_components/footer.ex",
    "components/form.ex": "lib/daisy_ui_components/form.ex",
    "components/header.ex": "lib/daisy_ui_components/header.ex",
    "components/hero.ex": "lib/daisy_ui_components/hero.ex",
    "components/icon.ex": "lib/daisy_ui_components/icon.ex",
    "components/indicator.ex": "lib/daisy_ui_components/indicator.ex",
    "components/input.ex": "lib/daisy_ui_components/input.ex",
    "components/join.ex": "lib/daisy_ui_components/join.ex",
    "components/label.ex": "lib/daisy_ui_components/label.ex",
    "components/list.ex": "lib/daisy_ui_components/list.ex",
    "components/loading.ex": "lib/daisy_ui_components/loading.ex",
    "components/menu.ex": "lib/daisy_ui_components/menu.ex",
    "components/modal.ex": "lib/daisy_ui_components/modal.ex",
    "components/navbar.ex": "lib/daisy_ui_components/navbar.ex",
    "components/pagination.ex": "lib/daisy_ui_components/pagination.ex",
    "components/progress.ex": "lib/daisy_ui_components/progress.ex",
    "components/radio.ex": "lib/daisy_ui_components/radio.ex",
    "components/range.ex": "lib/daisy_ui_components/range.ex",
    "components/select.ex": "lib/daisy_ui_components/select.ex",
    "components/sidebar.ex": "lib/daisy_ui_components/sidebar.ex",
    "components/stat.ex": "lib/daisy_ui_components/stat.ex",
    "components/swap.ex": "lib/daisy_ui_components/swap.ex",
    "components/table.ex": "lib/daisy_ui_components/table.ex",
    "components/tabs.ex": "lib/daisy_ui_components/tabs.ex",
    "components/text_input.ex": "lib/daisy_ui_components/text_input.ex",
    "components/textarea.ex": "lib/daisy_ui_components/textarea.ex",
    "components/toggle.ex": "lib/daisy_ui_components/toggle.ex",
    "components/tooltip.ex": "lib/daisy_ui_components/tooltip.ex"
  ]

  template(:core, [
    {:eex, :web,
     "daisy_ui_components.ex": "lib/:lib_web_name/daisy_ui_components.ex",
     "components/utils.ex": "lib/:lib_web_name/daisy_ui_components/utils.ex",
     "components/js_helpers.ex": "lib/:lib_web_name/daisy_ui_components/js_helpers.ex"}
  ])

  template(:accordion, [
    {:eex, :web, "components/accordion.ex": "lib/:lib_web_name/daisy_ui_components/accordion.ex"}
  ])

  template(:alert, [
    {:eex, :web, "components/alert.ex": "lib/:lib_web_name/daisy_ui_components/alert.ex"}
  ])

  template(:avatar, [
    {:eex, :web, "components/avatar.ex": "lib/:lib_web_name/daisy_ui_components/avatar.ex"}
  ])

  template(:back, [
    {:eex, :web, "components/back.ex": "lib/:lib_web_name/daisy_ui_components/back.ex"}
  ])

  template(:badge, [
    {:eex, :web, "components/badge.ex": "lib/:lib_web_name/daisy_ui_components/badge.ex"}
  ])

  template(:breadcrumbs, [
    {:eex, :web,
     "components/breadcrumbs.ex": "lib/:lib_web_name/daisy_ui_components/breadcrumbs.ex"}
  ])

  template(:button, [
    {:eex, :web, "components/button.ex": "lib/:lib_web_name/daisy_ui_components/button.ex"}
  ])

  template(:card, [
    {:eex, :web, "components/card.ex": "lib/:lib_web_name/daisy_ui_components/card.ex"}
  ])

  template(:checkbox, [
    {:eex, :web, "components/checkbox.ex": "lib/:lib_web_name/daisy_ui_components/checkbox.ex"}
  ])

  template(:collapse, [
    {:eex, :web, "components/collapse.ex": "lib/:lib_web_name/daisy_ui_components/collapse.ex"}
  ])

  template(:drawer, [
    {:eex, :web, "components/drawer.ex": "lib/:lib_web_name/daisy_ui_components/drawer.ex"}
  ])

  template(:dropdown, [
    {:eex, :web, "components/dropdown.ex": "lib/:lib_web_name/daisy_ui_components/dropdown.ex"}
  ])

  template(:fieldset, [
    {:eex, :web, "components/fieldset.ex": "lib/:lib_web_name/daisy_ui_components/fieldset.ex"}
  ])

  template(:flash, [
    {:eex, :web, "components/flash.ex": "lib/:lib_web_name/daisy_ui_components/flash.ex"}
  ])

  template(:footer, [
    {:eex, :web, "components/footer.ex": "lib/:lib_web_name/daisy_ui_components/footer.ex"}
  ])

  template(:form, [
    {:eex, :web, "components/form.ex": "lib/:lib_web_name/daisy_ui_components/form.ex"}
  ])

  template(:header, [
    {:eex, :web, "components/header.ex": "lib/:lib_web_name/daisy_ui_components/header.ex"}
  ])

  template(:hero, [
    {:eex, :web, "components/hero.ex": "lib/:lib_web_name/daisy_ui_components/hero.ex"}
  ])

  template(:icon, [
    {:eex, :web, "components/icon.ex": "lib/:lib_web_name/daisy_ui_components/icon.ex"}
  ])

  template(:indicator, [
    {:eex, :web, "components/indicator.ex": "lib/:lib_web_name/daisy_ui_components/indicator.ex"}
  ])

  template(:input, [
    {:eex, :web, "components/input.ex": "lib/:lib_web_name/daisy_ui_components/input.ex"}
  ])

  template(:join, [
    {:eex, :web, "components/join.ex": "lib/:lib_web_name/daisy_ui_components/join.ex"}
  ])

  template(:label, [
    {:eex, :web, "components/label.ex": "lib/:lib_web_name/daisy_ui_components/label.ex"}
  ])

  template(:list, [
    {:eex, :web, "components/list.ex": "lib/:lib_web_name/daisy_ui_components/list.ex"}
  ])

  template(:loading, [
    {:eex, :web, "components/loading.ex": "lib/:lib_web_name/daisy_ui_components/loading.ex"}
  ])

  template(:menu, [
    {:eex, :web, "components/menu.ex": "lib/:lib_web_name/daisy_ui_components/menu.ex"}
  ])

  template(:modal, [
    {:eex, :web, "components/modal.ex": "lib/:lib_web_name/daisy_ui_components/modal.ex"}
  ])

  template(:navbar, [
    {:eex, :web, "components/navbar.ex": "lib/:lib_web_name/daisy_ui_components/navbar.ex"}
  ])

  template(:pagination, [
    {:eex, :web,
     "components/pagination.ex": "lib/:lib_web_name/daisy_ui_components/pagination.ex"}
  ])

  template(:progress, [
    {:eex, :web, "components/progress.ex": "lib/:lib_web_name/daisy_ui_components/progress.ex"}
  ])

  template(:radio, [
    {:eex, :web, "components/radio.ex": "lib/:lib_web_name/daisy_ui_components/radio.ex"}
  ])

  template(:range, [
    {:eex, :web, "components/range.ex": "lib/:lib_web_name/daisy_ui_components/range.ex"}
  ])

  template(:select, [
    {:eex, :web, "components/select.ex": "lib/:lib_web_name/daisy_ui_components/select.ex"}
  ])

  template(:sidebar, [
    {:eex, :web, "components/sidebar.ex": "lib/:lib_web_name/daisy_ui_components/sidebar.ex"}
  ])

  template(:stat, [
    {:eex, :web, "components/stat.ex": "lib/:lib_web_name/daisy_ui_components/stat.ex"}
  ])

  template(:swap, [
    {:eex, :web, "components/swap.ex": "lib/:lib_web_name/daisy_ui_components/swap.ex"}
  ])

  template(:table, [
    {:eex, :web, "components/table.ex": "lib/:lib_web_name/daisy_ui_components/table.ex"}
  ])

  template(:tabs, [
    {:eex, :web, "components/tabs.ex": "lib/:lib_web_name/daisy_ui_components/tabs.ex"}
  ])

  template(:text_input, [
    {:eex, :web,
     "components/text_input.ex": "lib/:lib_web_name/daisy_ui_components/text_input.ex"}
  ])

  template(:textarea, [
    {:eex, :web, "components/textarea.ex": "lib/:lib_web_name/daisy_ui_components/textarea.ex"}
  ])

  template(:toggle, [
    {:eex, :web, "components/toggle.ex": "lib/:lib_web_name/daisy_ui_components/toggle.ex"}
  ])

  template(:tooltip, [
    {:eex, :web, "components/tooltip.ex": "lib/:lib_web_name/daisy_ui_components/tooltip.ex"}
  ])

  template(:dev, [
    {:eex, :web, @all_components}
  ])

  def prepare_project(%Project{app: app, base_path: base_path} = project) when not is_nil(app) do
    %{project | in_umbrella?: false, project_path: base_path}
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
    all_components = all_components()

    if Project.dev?(project) do
      component_bindings =
        all_components
        |> then(fn list -> ["jS_helpers" | list] end)
        |> Enum.sort()

      project = %{project | binding: [{:components, component_bindings} | project.binding]}
      copy_from(project, __MODULE__, :dev)
    else
      components = Keyword.get(project.opts, :components)

      components =
        if components == [] do
          all_components
        else
          check_components(components, all_components)
        end

      requested_components_with_deps =
        Enum.reduce(components, MapSet.new(["core"]), fn comp, acc ->
          MapSet.put(acc, comp)
          |> add_deps(comp)
        end)

      component_bindings =
        Enum.reduce(requested_components_with_deps, [], fn x, acc ->
          substitute_core(x, acc)
        end)
        |> Enum.sort()

      project = %{project | binding: [{:components, component_bindings} | project.binding]}

      requested_components_with_deps =
        Enum.map(requested_components_with_deps, fn comp -> String.to_atom(comp) end)

      Enum.each(requested_components_with_deps, fn component ->
        copy_from(project, __MODULE__, component)
      end)
    end

    project
  end

  defp substitute_core(x, acc) do
    if x == "core", do: ["jS_helpers" | acc], else: [x | acc]
  end

  defp check_components(components, all_components) do
    Enum.filter(components, fn comp ->
      ## Check if all are valid components
      comp in all_components
    end)
  end

  defp add_deps(set, "alert"), do: add_dep_component(set, "icon")

  defp add_deps(set, "back"), do: add_dep_component(set, "icon")

  defp add_deps(set, "breadcrumps"), do: add_dep_component(set, "icon")

  defp add_deps(set, "indicator"), do: add_dep_component(set, "badge")

  defp add_deps(set, "flash") do
    add_dep_component(set, "alert")
    |> add_dep_component("icon")
  end

  defp add_deps(set, "form") do
    add_dep_component(set, "fieldset")
    |> add_dep_component("icon")
    |> add_dep_component("input")
  end

  defp add_deps(set, "input") do
    add_dep_component(set, "checkbox")
    |> add_dep_component("radio")
    |> add_dep_component("range")
    |> add_dep_component("select")
    |> add_dep_component("textarea")
    |> add_dep_component("text_input")
  end

  defp add_deps(set, "pagination") do
    add_dep_component(set, "button")
    |> add_dep_component("join")
  end

  defp add_deps(set, "swap"), do: add_dep_component(set, "icon")

  defp add_deps(set, "sidebar") do
    add_dep_component(set, "drawer")
    |> add_dep_component("icon")
    |> add_dep_component("menu")
  end

  defp add_deps(set, _), do: set

  defp add_dep_component(set, component) do
    MapSet.put(set, component)
    |> add_deps(component)
  end

  defp all_components() do
    Enum.map(@all_components, fn {_, value} ->
      String.split(value, "/") |> Enum.at(-1) |> String.replace(".ex", "")
    end)
    |> Enum.filter(fn x -> x not in ["daisy_ui_components", "utils", "js_helpers"] end)
  end
end
