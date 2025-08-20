for path <- :code.get_path(),
    Regex.match?(~r/daisy-[\w\.\-]+\/ebin$/, List.to_string(path)) do
  Code.delete_path(path)
end

defmodule Installer.MixProject do
  use Mix.Project

  @version "0.2.0"
  @source_url "https://github.com/phcurado/daisy_ui_components/tree/main/installer"

  def project do
    [
      app: :daisy_ui_installer,
      version: @version,
      elixir: "~> 1.18",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      ## Hex
      package: package(),
      source_url: @source_url,
      description: "DaisyUI component library installer for LiveView"
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:eex, :logger]
    ]
  end

  defp package() do
    [
      maintainers: ["Paulo Curado", "Pepe Marquez"],
      licenses: ["Apache-2.0"],
      files: ~w(lib templates mix.exs README* LICENSE*),
      links: %{"GitHub" => @source_url}
    ]
  end

  def cli do
    [preferred_envs: [docs: :docs]]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:ex_doc, "~> 0.37", only: :docs},
      {:credo, "~> 1.7", only: [:dev, :test], runtime: false}
    ]
  end
end
