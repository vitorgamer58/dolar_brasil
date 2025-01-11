defmodule DolarBrasil.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      {Bandit, plug: DolarBrasil.Router, scheme: :http, port: 8000}
    ]

    opts = [strategy: :one_for_one, name: DolarBrasil.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
