import Config

Dotenv.load!()

config :lazy_doc, :token, System.get_env("API_TOKEN")
