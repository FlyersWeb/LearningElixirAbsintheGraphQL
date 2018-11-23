# Testabsinthe

## To Launch an Elixir project

➜  test-absinthe mix local.hex
➜  test-absinthe mix phx.new --no-ecto --no-webpack --no-html --app testabsinthe .
➜  test-absinthe mix deps.get
➜  test-absinthe mix phx.server

## To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.
Websocket at [`ws://localhost:4000/socket/websocket`](ws://localhost:4000/socket/websocket)

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Example available queries

```
query {
  repo(id: "foo") {
    id
    name
  }
}


subscription {
    commentAdded(repoName: "foo") {
      content
    }
}

mutation {
  submitComment(content: "Commentaire constructif", repoName: "foo") {
    content
  }
}
```

## Learn more

  * Official website: http://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Mailing list: http://groups.google.com/group/phoenix-talk
  * Source: https://github.com/phoenixframework/phoenix
