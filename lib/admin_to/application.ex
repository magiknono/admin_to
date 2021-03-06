defmodule AdminTo.Application do
  @moduledoc false
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      AdminTo.Repo,
      # Start the Telemetry supervisor
      AdminToWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: AdminTo.PubSub},
      # Start the Endpoint (http/https)
      AdminToWeb.Endpoint
      # Start a worker by calling: AdminTo.Worker.start_link(arg)
      # {AdminTo.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: AdminTo.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    AdminToWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
