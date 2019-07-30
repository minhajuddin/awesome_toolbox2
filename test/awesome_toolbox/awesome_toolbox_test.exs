defmodule AwesomeToolboxTest do
  use AwesomeToolbox.DataCase

  defmodule FakeGithub do
    def readme("foo/awesome") do
    {:ok,
      """
      # Awesome Toolbox

      Awesome toolbox is awesome!!
      """
    }
    end

    def readme("fox/awesome") do
    {:ok,
      """
      # Awesome Toolbox

      Foo Bar (https://github.com/minhajuddin/foobar)
      """
    }
    end

    def star_count(repo_name), do: 100
  end

  describe "annotate_readme" do
    test "returns an unchanged README when readme doesn't have any links" do
      assert AwesomeToolbox.annotate_readme("foo/awesome") == """
      # Awesome Toolbox

      Awesome toolbox is awesome!!
      """
    end

    test "transforms lines containing github links by appending star counts" do
      assert AwesomeToolbox.annotate_readme("fox/awesome") == """
      # Awesome Toolbox

      Foo Bar (https://github.com/minhajuddin/foobar) [100 :star:]
      """
    end
  end
end
