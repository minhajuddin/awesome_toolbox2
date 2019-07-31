defmodule AwesomeToolbox do
  @github_api Application.get_env(:awesome_toolbox, :github_api, AwesomeToolbox.Github)

  @doc """
  Takes a github repo url like "h4cc/awesome-elixir" and spits out an annotated awesome list.
  """
  def annotate_readme(repo_name) do
    # get the contents of the README
    {:ok, readme} = @github_api.readme(repo_name)

    # for each line which contains a github repo link, append the star count
    readme
    |> String.split("\n")
    |> Enum.map(fn line ->
      # transform line
      annotate_line(line)
    end)
    |> Enum.join("\n")
  end

  defp annotate_line(line) do
    # if line contains a github link, get its star count and append it to the link
    with repo_names when not is_nil(repo_names) <-
           Regex.named_captures(~r{https://github.com/(?<repo_name>[^/]+/[A-Za-z0-9._-]+)}, line),
         {:ok, star_count} <- @github_api.star_count(repo_names["repo_name"]) do
      "#{line} [#{star_count} :star:]"
    else
      _ -> line
    end
  end
end
