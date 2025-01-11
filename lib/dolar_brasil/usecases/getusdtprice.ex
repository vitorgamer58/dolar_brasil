defmodule DolarBrasil.Usecases.GetUsdtPrice do
  alias DolarBrasil.Infra.Clients.Exchange

  def run() do
    Exchange.get_usdt_info_from_exchange()
    |> case do
      {:ok, value} -> {:ok, value}
      {:error} -> {:error}
    end
  end
end
