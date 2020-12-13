defmodule AdminToWeb.PageLive do
  @moduledoc false
  use AdminToWeb, :live_view
  alias AdminTo.Accounts

  @impl true
  def mount(_params, %{"user_token" => token}, socket) do
    {:ok, assign(socket, query: "", results: %{}, current_user: Accounts.get_user_by_session_token(token))}
  end

end
