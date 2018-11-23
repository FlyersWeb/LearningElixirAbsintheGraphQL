defmodule Testabsinthe.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    # List all child processes to be supervised
    children = [
      # Start the endpoint when the application starts
      TestabsintheWeb.Endpoint,
      absinthe_subscriptions(TestabsintheWeb.Endpoint),
      # Starts a worker by calling: Testabsinthe.Worker.start_link(arg)
      # {Testabsinthe.Worker, arg},
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Testabsinthe.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    TestabsintheWeb.Endpoint.config_change(changed, removed)
    :ok
  end

  def absinthe_subscriptions(name) do
    %{
      type: :supervisor,
      id: Absinthe.Subscription,
      start: {Absinthe.Subscription, :start_link, [name]}
    }
  end
end
