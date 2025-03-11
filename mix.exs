defmodule DaisyUIComponents.MixProject do
  use Mix.Project

  @source_url "https://github.com/phcurado/daisy_ui_components"
  @version "0.7.6"

  def project do
    [
      app: :daisy_ui_components,
      version: @version,
      elixir: "~> 1.14",
      start_permanent: Mix.env() == :prod,
      elixirc_paths: elixirc_paths(Mix.env()),
      deps: deps(),
      # Hex
      description: "DaisyUI component library for LiveView",
      source_url: @source_url,
      package: package(),
      # Docs
      name: "DaisyUIComponents",
      docs: docs(),
      test_coverage: [tool: ExCoveralls],
      preferred_cli_env: [
        coveralls: :test,
        "coveralls.detail": :test,
        "coveralls.post": :test,
        "coveralls.html": :test
      ]
    ]
  end

  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      {:phoenix_live_view, "~> 1.0"},
      {:jason, "~> 1.4", only: [:dev, :test]},
      {:dialyxir, "~> 1.4", only: [:dev, :test], runtime: false},
      {:credo, "~> 1.7", only: [:dev, :test], runtime: false},
      {:ex_doc, "~> 0.31", only: :dev, runtime: false},
      {:excoveralls, "~> 0.18", only: :test},
      {:assert_html, "~> 0.1", only: [:dev, :test]}
    ]
  end

  defp package() do
    [
      maintainers: ["Paulo Curado"],
      licenses: ["Apache-2.0"],
      files: ~w(lib .formatter.exs mix.exs README* LICENSE*),
      links: %{"GitHub" => @source_url}
    ]
  end

  defp docs do
    [
      main: "DaisyUIComponents",
      source_ref: "v#{@version}",
      canonical: "https://hexdocs.pm/daisy_ui_components",
      source_url: @source_url,
      groups_for_modules: [
        Components: [
          DaisyUIComponents.Alert,
          DaisyUIComponents.Avatar,
          DaisyUIComponents.Back,
          DaisyUIComponents.Badge,
          DaisyUIComponents.Breadcrumbs,
          DaisyUIComponents.Button,
          DaisyUIComponents.Card,
          DaisyUIComponents.Checkbox,
          DaisyUIComponents.Drawer,
          DaisyUIComponents.Dropdown,
          DaisyUIComponents.Form,
          DaisyUIComponents.Header,
          DaisyUIComponents.Hero,
          DaisyUIComponents.Icon,
          DaisyUIComponents.Indicator,
          DaisyUIComponents.Input,
          DaisyUIComponents.Join,
          DaisyUIComponents.List,
          DaisyUIComponents.Loading,
          DaisyUIComponents.Menu,
          DaisyUIComponents.Modal,
          DaisyUIComponents.Navbar,
          DaisyUIComponents.Pagination,
          DaisyUIComponents.Radio,
          DaisyUIComponents.Range,
          DaisyUIComponents.Select,
          DaisyUIComponents.Stat,
          DaisyUIComponents.Swap,
          DaisyUIComponents.Table,
          DaisyUIComponents.TextInput,
          DaisyUIComponents.Textarea,
          DaisyUIComponents.Toggle,
          DaisyUIComponents.Tooltip
        ]
      ]
    ]
  end
end
