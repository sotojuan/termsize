defmodule TermSize do
  @moduledoc """
  Reliably get the terminal window size
  """

  @doc """
  Returns the current terminal size
  """
  @spec get :: {integer, integer}
  def get do
    case :os.type do
      {:win32, _} ->
        win
      {:unix, _} ->
        tput
    end
  end

  defp tput do
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

    {cols, rows}
  end

  defp win do
    path = Path.join([__DIR__, "win-term-size"])

    [cols, rows] =
      path
      |> Porcelain.exec([])
      |> Map.get(:out)
      |> String.trim
      |> String.split(~r/\r?\n/)
      |> Enum.map(&String.to_integer/1)

    {cols, rows}
  end
end
