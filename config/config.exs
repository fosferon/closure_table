import Mix.Config

config :mix_test_watch,
  clear: true

level =
  if System.get_env("DEBUG") do
    :debug
  else
    :info
  end

config :closure_table,
  log: true,
  log_hex: true

config :logger, :console,
  level: level,
  format: "$date $time [$level] $metadata$message\n"

config :eye_drops,
  tasks: [
    %{
      id: :docs,
      name: "docs",
      run_on_start: true,
      cmd: "mix docs",
      paths: ["lib/*", "README.md", "examples/*", "mix.exs"]
    }
  ]

config :closure_table, CTE.Repo,
  database: "ct_ecto_test",
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  adapter: Ecto.Adapters.Postgres,
  pool: Ecto.Adapters.SQL.Sandbox
