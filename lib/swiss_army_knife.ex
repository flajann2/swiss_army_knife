defmodule SwissArmyKnife do
  @moduledoc """
  Documentation for `SwissArmyKnife`.
  """
  import IO
  use Application
  
  alias System, as: Sy
  alias HTTPoison, as: Hp
  alias Jason, as: Json
  @doc """
  TODO: Document!
  """

  def process({[:extip], _}) do
    # The following are defined here since this code
    # will most likely have to be modified if these are
    # changed.
    ipv4 = "https://ipv4.jsonip.com"
    ipv6 = "https://ipv6.jsonip.com"
    geo  = "http://ip-api.com/json/"
  
    {:ok, hip}  = Hp.get(ipv4)
    {:ok, jip}  = hip.body |> Json.decode
    {:ok, info} = geo <> jip["ip"] |> Hp.get
    {:ok, meo}  = info.body |> Json.decode
    puts jip["ip"] <> ", " <> meo["city"] <> ", " <> meo["country"] <> " -- " <> meo["countryCode"]
  end

  def process({[:kernel], _}) do
    puts "kernel"
  end

  def process({[_], %Optimus.ParseResult{}}) do
    puts "No arguments given"
    :error
  end    
end
