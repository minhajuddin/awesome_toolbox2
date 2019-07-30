defmodule AwesomeToolbox.Repo do
  use Ecto.Repo,
    otp_app: :awesome_toolbox,
    adapter: Ecto.Adapters.Postgres
end
