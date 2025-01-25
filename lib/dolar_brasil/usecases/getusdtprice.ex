defmodule DolarBrasil.Usecases.GetUsdtPrice do
  alias DolarBrasil.Infra.Clients.Exchange
  alias DolarBrasil.Infra.Clients.Cache

  def run() do
    get_usdt_info_from_cache()
    |> case do
      {:ok, value} when value != nil ->
        {:ok, value}

      _ ->
        case Exchange.get_usdt_info_from_exchange() do
          {:ok, value} ->
            save_usdt_info_in_cache(value)
            {:ok, value}

          {:error} ->
            {:error}
        end
    end
  end

  defp get_usdt_info_from_cache() do
    Cache.get_value("USDT")
  end

  defp save_usdt_info_in_cache(value) do
    Cache.put_value("USDT", value)
  end
end
