# TestDeploy

playing around with external config dynamic logging.  PROTOTYPE



## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed as:

  1. Add test_deploy to your list of dependencies in `mix.exs`:

        def deps do
          [{:test_deploy, "~> 0.0.1"}]
        end

  2. Ensure test_deploy is started before your application:

        def application do
          [applications: [:test_deploy]]
        end

