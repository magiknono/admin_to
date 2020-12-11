defmodule AdminToWeb.LandingController do
  use AdminToWeb, :controller

  plug :put_layout, "landing.html"
  def index(conn, _params) do
    render(conn, "index.html")
  end
end
