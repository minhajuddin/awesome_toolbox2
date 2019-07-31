defmodule AwesomeToolbox.Github do
  # TODO: improve performance here!

  require Logger

  # readme("elixir-lang/elixir")
  def readme(repo_name) do
    [owner, repo] = String.split(repo_name, "/", parts: 2)
    {200, body, _httpoison_response} = Tentacat.Contents.readme(owner, repo)

    Base.decode64(body["content"], ignore: :whitespace)
  end

  def star_count(repo_name) do
    [owner, repo] = String.split(repo_name, "/", parts: 2)

    case Tentacat.Repositories.repo_get(owner, repo) do
      {200, body, _httpoison_response} ->
        {:ok, body["stargazers_count"]}

      {error_status_code, _, httpoison_response} ->
        Logger.error("STAR_COUNT_ERROR: #{repo_name} #{inspect(httpoison_response)}")
        {:error, error_status_code}
    end
  end
end
