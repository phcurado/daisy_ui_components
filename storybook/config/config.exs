# This file is responsible for configuring your application
# and its dependencies with the aid of the Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
import Config

config :daisy_ui_components_site,
  generators: [timestamp_type: :utc_datetime]

# Configures the endpoint
config :daisy_ui_components_site, DaisyUIComponentsSiteWeb.Endpoint,
  url: [host: "localhost"],
  adapter: Bandit.PhoenixAdapter,
  render_errors: [
    formats: [html: DaisyUIComponentsSiteWeb.ErrorHTML, json: DaisyUIComponentsSiteWeb.ErrorJSON],
    layout: false
  ],
  pubsub_server: DaisyUIComponentsSite.PubSub,
  live_view: [signing_salt: "8YGUJnQL"]

# Configure esbuild (the version is required)
config :esbuild,
  version: "0.17.11",
  daisy_ui_components_site: [
    args:
      ~w(js/app.js --bundle --target=es2017 --outdir=../priv/static/assets --external:/fonts/* --external:/images/*),
    cd: Path.expand("../assets", __DIR__),
    env: %{"NODE_PATH" => Path.expand("../deps", __DIR__)}
  ],
  storybook: [
    args:
      ~w(js/storybook.js js/storybook.js --bundle --target=es2017 --outdir=../priv/static/assets --external:/fonts/* --external:/images/*),
    cd: Path.expand("../assets", __DIR__),
    env: %{"NODE_PATH" => Path.expand("../deps", __DIR__)}
  ]

# Configure tailwind (the version is required)
config :tailwind,
  version: "4.0.15",
  daisy_ui_components_site: [
    args: ~w(
      --input=assets/css/main.css
      --output=priv/static/assets/main.css
    ),
    cd: Path.expand("..", __DIR__)
  ],
  storybook: [
    args: ~w(
      --input=assets/css/storybook.css
      --output=priv/static/assets/storybook.css
    ),
    cd: Path.expand("..", __DIR__)
  ]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{config_env()}.exs"
