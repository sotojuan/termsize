defmodule TermSize do
  @moduledoc false

  def get do
    case :os.type do
      {:win32, _} ->
        "Coming soon"
      {:unix, _} ->
        tput
    end
  end

  def tput do
    cols =
      "tput"
      |> Porcelain.exec(["cols"])
      |> Map.get(:out)
      |> String.trim
      |> String.to_integer

    rows =
      "tput"
      |> Porcelain.exec(["lines"])
      |> Map.get(:out)
      |> String.trim
      |> String.to_integer

    %{:cols => cols, :rows => rows}
  end
end
