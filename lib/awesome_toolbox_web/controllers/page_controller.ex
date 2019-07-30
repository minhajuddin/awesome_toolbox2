defmodule AwesomeToolboxWeb.PageController do
  use AwesomeToolboxWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
