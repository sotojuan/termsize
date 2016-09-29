defmodule TermSize.Mixfile do
  use Mix.Project

  def project do
    [
      app: :termsize,
       version: "0.0.0",
       elixir: "~> 1.3",
       build_embedded: Mix.env == :prod,
       start_permanent: Mix.env == :prod,
       description: description,
       package: package,
       deps: deps
   ]
  end
  def application do
    [applications: [:logger, :porcelain]]
  end

  defp deps do
    [
      {:credo, "~> 0.4", only: [:dev, :test]},
      {:porcelain, "~> 2.0"}
    ]
  end

  defp description do
    """
    Reliably get the terminal window size
    """
  end

  defp package do
    [
      maintainers: ["sotojuan"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/sotojuan/termsize"}
    ]
  end
end
