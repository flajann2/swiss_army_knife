defmodule SwissArmyKnife do
  @moduledoc """
  Documentation for `SwissArmyKnife`.
  """
  import IO
  alias System, as: Sy
  alias HTTPoison, as: Hp
  alias Jason, as: Json
  @doc """
  TODO: Document!
  """
  def process({[:extip], _}) do
    getip1 = "https://icanhazip.com"
    getip2 = "https://ipv4.jsonip.com"
    getip3 = "https://ipv6.jsonip.com"
    getgeo = "http://ip-api.com/json/"

    {:ok, hip} = Hp.get(getip2)
    puts "*** hip ***"
    IO.inspect hip.body
    
    {:ok, jip} = Json.decode hip.body
    puts "*** jip ***"
    IO.inspect jip["ip"]

    {:ok, geo} = Hp.get(getgeo <> jip["ip"])
    puts "*** geo ***"
    {:ok, meo} = geo.body |> Json.decode
    IO.inspect meo
  end

  def process({[:kernel], _}) do
    puts "kernel"
  end

  def process({[_], %Optimus.ParseResult{}}) do
    puts "No arguments given"
    :error
  end    
end
