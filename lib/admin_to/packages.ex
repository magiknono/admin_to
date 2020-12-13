defmodule AdminTo.Packages do
  @moduledoc """
  The Packages context.
  """

  def search_by_name(name) do
    :timer.sleep(2000)
    list_packages()
    |> Enum.filter(&(&1.name == name))
  end

  def list_packages do
    [
      %{
        name: "htop"
      },
      %{
        name: "bash"
      },
      %{
        name: "bashtop"
      }
    ]
  end

end
