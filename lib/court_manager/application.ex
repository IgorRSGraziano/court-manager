defmodule CourtManager.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      CourtManagerWeb.Telemetry,
      CourtManager.Repo,
      {DNSCluster, query: Application.get_env(:court_manager, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: CourtManager.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: CourtManager.Finch},
      # Start a worker by calling: CourtManager.Worker.start_link(arg)
      # {CourtManager.Worker, arg},
      # Start to serve requests, typically the last entry
      CourtManagerWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: CourtManager.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    CourtManagerWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
