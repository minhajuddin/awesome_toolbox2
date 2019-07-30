defmodule AwesomeToolbox do
  alias AwesomeToolbox.Github

  @github_api Application.get_env(:awesome_toolbox, :github_api)

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
    repo_names = Regex.named_captures(~r{https://github.com/(?<repo_name>[^/]+/[^/]+)}, line)

    if repo_names do
      "#{line} [#{@github_api.star_count(repo_names["repo_name"])} :star:]"
    else
      line
    end
  end

end
