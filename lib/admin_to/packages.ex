defmodule AdminTo.Packages do
  @moduledoc """
  List and search packages.
  """
  @http_ok 200
  @http_not_found 404
  @debian_url "https://sources.debian.org/api/search/"
  @suite_name "buster"

  @doc """
  Searching packages by name

  ## Example

      iex> Packages.search_by_name("htop")
  """
  def search_by_name(name) do
    :timer.sleep(1000)
    request_api(name)
    |> format_response()
    |> list_packages()
    |> Enum.filter(&(&1.name == name))
  end


  @doc """
  Searching package by name with external api http request

  ## Example

      iex> Packages.request_api("htop")
  """
  def request_api(package) do
    case HTTPoison.get("#{@debian_url}/#{package}/?suite=#{@suite_name}") do
      {:ok, %HTTPoison.Response{status_code: @http_ok, body: body}} ->
      response =
        body
        |> Jason.decode!()
      response
      {:ok, %HTTPoison.Response{status_code: @http_not_found}} ->
        IO.puts "Not found :("
      {:error, %HTTPoison.Error{reason: reason}} ->
        IO.inspect reason
    end
  end

   @doc """
  Format map response with the exact value searched
  """
  def format_response(response) do
    response["results"]["exact"]["name"]
  end

    @doc """
  List packages from requested api response
  """
  def list_packages(formatted_response) do
    [
      %{
        name: formatted_response,
        info: "https://packages.debian.org/buster/#{formatted_response}",
        man: "https://manpages.debian.org/buster/#{formatted_response}"
      }
    ]
  end

end
