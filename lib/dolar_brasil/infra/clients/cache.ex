defmodule DolarBrasil.Infra.Clients.Cache do
  def get_value(key) do
    Cachex.get(:dolar_brasil_cache, key)
  end

  def put_value(key, value) do
    Cachex.put(:dolar_brasil_cache, key, value, ttl: :timer.seconds(30))
  end
end
