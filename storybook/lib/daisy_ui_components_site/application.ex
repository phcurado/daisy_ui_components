defmodule DaisyUIComponentsSite.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      DaisyUIComponentsSiteWeb.Telemetry,
      {DNSCluster,
       query: Application.get_env(:daisy_ui_components_site, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: DaisyUIComponentsSite.PubSub},
      # Start a worker by calling: DaisyUIComponentsSite.Worker.start_link(arg)
      # {DaisyUIComponentsSite.Worker, arg},
      # Start to serve requests, typically the last entry
      DaisyUIComponentsSiteWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: DaisyUIComponentsSite.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    DaisyUIComponentsSiteWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
