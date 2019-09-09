use Mix.Config

# For development, we disable any cache and enable
# debugging and code reloading.
#
# The watchers configuration can be used to run external
# watchers to your application. For example, we use it
# with webpack to recompile .js and .css sources.
config :horizon, HorizonWeb.Endpoint,
  http: [
    port: 4000,
    protocol_options: [
      idle_timeout: 2_000
    ]
  ],
  code_reloader: true,
  check_origin: false,
  watchers: [],
  api_origins: [~r{^https?://(.*\.?)podcloud\.test$}]

config :horizon, Horizon.SecureTokens,
  test: %{
    key: """
    -----BEGIN PUBLIC KEY-----
    MIICIjANBgkqhkiG9w0BAQEFAAOCAg8AMIICCgKCAgEAy957s+HNvODchwr0pDV+
    B5A33FaiJacsU52E/Z3yIZB/KUTh9ZXulYiPjryVBkitpOj86DBK9hwAvW3iRBP7
    OzneJDvzuGcbdJpx24JLxsHMEX8YYv5RrLqOgSjICY796TLbEHDUvv7uXypeQJ74
    JrtbYVJj87+avs7VTn3cIvzGialXd9tA16xP87Ew04xpTQfG21xNUZbru3mMxgmK
    7Xp1dT+EnJRJIKFYQMQ+DwJiR09SSDkLOF+jQf1KgOJkJEWDcp4kIMAkKih0zDJJ
    z4bt3JtyyYerPKrqAKpLC6ROogf0sHymxjl+ei+LVz0NlO4tS1YJCG5F9UOf6DIi
    +2a8kYKLRYsDliCNzgfb7/npNav5JlOsuCfxz4T4fjEmuMXdjcqcni7hxXmHh3fU
    0Pj2rbFg0Iosb1BTkA9+87dAnbyrtkpUPv0k2IKWW049uj21tw9yhon6C18zT1vm
    QvPanXJ1TohpbjIjXVcG0g3hwmZcvAm+HWJ1BQLsDInxdpLO6d0W7KI14hfwlCCq
    FRHZO6+pXpRTMveNcEwtuCEZTs4+KuvtqE8VztqitAGzXn3F/7F8wbrq27ikU5CK
    n7uHNwUA9hd/DzO8BTsoPSt+hR7UxUoxevOXDOguhv9ACsGemWtzoI4Rlo6CtRqG
    /v2o7+c9wdAbAsj6OrYAjPkCAwEAAQ==
    -----END PUBLIC KEY-----
    """
  }

# ## SSL Support
#
# In order to use HTTPS in development, a self-signed
# certificate can be generated by running the following
# Mix task:
#
#     mix phx.gen.cert
#
# Note that this task requires Erlang/OTP 20 or later.
# Run `mix help phx.gen.cert` for more information.
#
# The `http:` config above can be replaced with:
#
#     https: [
#       port: 4001,
#       cipher_suite: :strong,
#       keyfile: "priv/cert/selfsigned_key.pem",
#       certfile: "priv/cert/selfsigned.pem"
#     ],
#
# If desired, both `http:` and `https:` keys can be
# configured to run both http and https servers on
# different ports.

# Do not include metadata nor timestamps in development logs
config :logger, :console, format: "[$level] $message\n"

# Set a higher stacktrace during development. Avoid configuring such
# in production as building large stacktraces may be expensive.
config :phoenix, :stacktrace_depth, 20

# Initialize plugs at runtime for faster development compilation
config :phoenix, :plug_init_mode, :runtime

# Configure your database
config :horizon, Horizon.Repo,
  username: "postgres",
  password: "postgres",
  database: "horizon_dev",
  hostname: "postgres",
  pool_size: 10
