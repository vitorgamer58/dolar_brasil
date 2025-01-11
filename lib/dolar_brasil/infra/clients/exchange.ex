defmodule DolarBrasil.Infra.Clients.Exchange do
  require Logger

  def get_usdt_info_from_exchange() do
    case HTTPoison.get("https://data-api.binance.vision/api/v3/ticker/24hr?symbol=USDTBRL", []) do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        {:ok, body}

      {:error, %HTTPoison.Error{reason: reason}} ->
        Logger.error("Failed to get USDT information: #{reason}")
        {:error}
    end
  end
end
