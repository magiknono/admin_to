defmodule AdminTo.Packages do
  @moduledoc """
  List and search packages.
  """

  @doc """
  Searching packages by name

  ## Example

      iex> Packages.search_by_name("htop")
  """
  def search_by_name(name) do
    :timer.sleep(2000)
    list_packages()
    |> Enum.filter(&(&1.name == name))
  end

  @doc """
  List packages throught a static list
  """
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
