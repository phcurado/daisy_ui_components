defmodule DaisyUIComponents.MixProject do
  use Mix.Project

  @source_url "https://github.com/phcurado/daisy_ui_components"
  @version "0.1.7"

  def project do
    [
      app: :daisy_ui_components,
      version: @version,
      elixir: "~> 1.14",
      start_permanent: Mix.env() == :prod,
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
        Types: [
          DaisyUIComponents.Alert,
          DaisyUIComponents.Avatar,
          DaisyUIComponents.Badge,
          DaisyUIComponents.ButtonGroup,
          DaisyUIComponents.Button,
          DaisyUIComponents.Card,
          DaisyUIComponents.Checkbox,
          DaisyUIComponents.CoreComponents,
          DaisyUIComponents.Drawer,
          DaisyUIComponents.Form,
          DaisyUIComponents.Icon,
          DaisyUIComponents.Input,
          DaisyUIComponents.Join,
          DaisyUIComponents.Modal,
          DaisyUIComponents.Navbar,
          DaisyUIComponents.Pagination,
          DaisyUIComponents.Select,
          DaisyUIComponents.Stat,
          DaisyUIComponents.Table,
          DaisyUIComponents.TextInput,
          DaisyUIComponents.Textarea,
          DaisyUIComponents.Tooltip,
          DaisyUIComponents.Loading
        ]
      ]
    ]
  end
end
