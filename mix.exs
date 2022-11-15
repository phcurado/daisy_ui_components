defmodule LiveDaisyuiComponents.MixProject do
  use Mix.Project

  @source_url "https://github.com/phcurado/live_daisyui_components"
  @version "0.1.0"

  def project do
    [
      app: :live_daisyui_components,
      version: @version,
      elixir: "~> 1.14",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      # Hex
      description: "DaisyUI wrapper for LiveView",
      source_url: @source_url,
      package: package(),
      # Docs
      name: "LiveDaisyUIComponents",
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
      {:phoenix_live_view, "~> 0.18"},
      {:jason, "~> 1.4", only: [:dev, :test]},
      {:dialyxir, "~> 1.0", only: [:dev, :test], runtime: false},
      {:credo, "~> 1.6", only: [:dev, :test], runtime: false},
      {:ex_doc, "~> 0.27", only: :dev, runtime: false},
      {:excoveralls, "~> 0.10", only: :test}
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
      main: "LiveDaisyUIComponents",
      source_ref: "v#{@version}",
      canonical: "https://hexdocs.pm/live_daisyui_components",
      source_url: @source_url
    ]
  end
end
