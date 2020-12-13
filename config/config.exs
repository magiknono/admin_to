# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :admin_to,
  ecto_repos: [AdminTo.Repo]

# Configures the endpoint
config :admin_to, AdminToWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "nTWKjM+YGwHuwymzfoSwWGmir0t5PQTRJvfYU0WtOHm43X9vccVLAZi3IpDSzUQC",
  render_errors: [view: AdminToWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: AdminTo.PubSub,
  live_view: [signing_salt: "EvIBMI8o"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"

# Gitops configuration
config :git_ops,
  mix_project: Mix.Project.get!(),
  changelog_file: "CHANGELOG.md",
  repository_url: "https://github.com/magiknono/admin_to",
  types: [
    # Makes an allowed commit type called `tidbit` that is not
    # shown in the changelog
    #tidbit: [
    #  hidden?: true
    #],
    # Makes an allowed commit type called `important` that gets
    # a section in the changelog with the header "Important Changes"
    important: [
      header: "Important Changes"
    ]
  ],
  # Instructs the tool to manage your mix version in your `mix.exs` file
  # See below for more information
  manage_mix_version?: true,
  # Instructs the tool to manage the version in your README.md
  # Pass in `true` to use `"README.md"` or a string to customize
  manage_readme_version: "README.md",
  version_tag_prefix: "v"
