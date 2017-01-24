defmodule TestDeploy.Mixfile do
  use Mix.Project

  def project do
    [app: :test_deploy,
     version: "0.0.1",
     elixir: "~> 1.2",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps]
  end

  def application do
    [applications: [:logger],
     mod: {TestDeploy, []}]
  end

  defp deps do
    [{:external_config, "~> 0.1.0"},{:distillery, "~> 1.1"}]
  end
end
