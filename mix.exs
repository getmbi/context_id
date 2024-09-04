defmodule ContextID.MixProject do
  use Mix.Project

  def project do
    [
      app: :context_id,
      version: "0.1.1",
      elixir: "~> 1.0",
      deps: deps(),
      name: "ContextID",
      description: "A package for generating readable, context-rich IDs.",
      package: package(),
      docs: docs()
    ]
  end

  defp deps do
    [
      {:ex_doc, "~> 0.27", only: :dev, runtime: false}
    ]
  end

  defp package do
    [
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/getmbi/context_id"}
    ]
  end

  defp docs do
    [
      main: "readme",
      extras: ["README.md"]
    ]
  end
end
