defmodule DolarBrasil.Router do
  alias DolarBrasil.Usecases
  use Plug.Router

  plug(:match)
  plug(:dispatch)

  get "/ping" do
    send_resp(conn, 200, "pong")
  end

  get "/usd" do
    case Usecases.GetUsdtPrice.run() do
      {:ok, value} -> send_resp(conn, 200, value)
      {:error} -> send_resp(conn, 500, "")
    end
  end

  match _ do
    send_resp(conn, 404, "")
  end
end
