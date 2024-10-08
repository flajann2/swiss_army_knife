defmodule SwissArmyKnife.Pro do
  import IO
  
  alias System, as: Sy
  alias HTTPoison, as: Hp
  alias Jason, as: Json

  def process({[:extip], o}) do
    # The following are defined here since this code
    # will most likely have to be modified if these are
    # changed.
    ipv4 = "https://ipv4.jsonip.com"
    ipv6 = "https://ipv6.jsonip.com"
    geo  = "http://ip-api.com/json/"

    %{ipv6: ipv6_f, nolocation: noloc_f, verbosity: _verbosity_f} = o.flags
    
    {:ok, hip}  = if ipv6_f, do: Hp.get(ipv6), else: Hp.get(ipv4)
    {:ok, jip}  = hip.body |> Json.decode
    {:ok, info} = geo <> jip["ip"] |> Hp.get
    {:ok, meo}  = info.body |> Json.decode
    puts jip["ip"] <> if noloc_f, do: "", else: ", " <> meo["city"] <> ", " <> meo["country"] <> " -- " <> meo["countryCode"]
    :ok
  end

  def process({[:kernel], _}) do
    {kernel,    0}     = Sy.cmd("uname", ["-r"])
    {installed, 0}     = Sy.cmd("pacman", ["-Q", "linux"])
    {installed_lts, 0} = Sy.cmd("pacman", ["-Q", "linux-lts"])

    puts "      running: " <> String.trim kernel
    puts "    installed: " <> String.trim installed
    puts "installed LTS: " <> String.trim installed_lts
    :ok
  end
 
  def process({[:sleep], _}) do
    Sy.cmd("systemctl", ["suspend", "-i"]) 
    :ok
  end
  
  def process({[:zfs], _}) do
    puts "Not Implemented Yet."
    :ok
  end

  def process(%Optimus.ParseResult{args: %{}}) do
    puts """
    
        Welcome to Swiss Army Knife by Fred Mitchell.
        Please run 'sak --help' for documentation.
    """
    :error
  end
end
