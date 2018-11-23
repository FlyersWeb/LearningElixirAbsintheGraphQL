defmodule TestabsintheWeb.Router do
  use TestabsintheWeb, :router

  forward "/api",
    Absinthe.Plug,
    schema: TestabsintheWeb.Schema

  forward "/graphiql",
    Absinthe.Plug.GraphiQL,
    schema: TestabsintheWeb.Schema,
    socket_url: "ws://localhost:4000/socket",
    interface: :simple
end
