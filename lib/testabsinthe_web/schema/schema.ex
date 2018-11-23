defmodule TestabsintheWeb.Schema do
  use Absinthe.Schema

  @desc "A repo"
  object :repo do
    field :id, :id
    field :name, :string
  end

  @desc "A comment"
  object :comment do
    field :content, :string
  end

  # Example data
  @repos %{
    "foo" => %{id: "foo", name: "Foo"},
    "bar" => %{id: "bar", name: "Bar"}
  }

  query do
    field :repo, :repo do
      arg :id, non_null(:id)
      resolve fn %{id: repo_id}, _ ->
        {:ok, @repos[repo_id]}
      end
    end
  end

  mutation do
    field :submit_comment, :comment do
      arg :repo_name, non_null(:string)
      arg :content, non_null(:string)

      resolve fn %{repo_name: repo_name, content: content}, _ ->
        resp = Absinthe.Subscription.publish(TestabsintheWeb.Endpoint, %{content: content}, comment_added: repo_name)
        IO.inspect(resp, label: "SHOULD MUTATE")
        {:ok, %{content: content}}
      end
    end
  end

  subscription do
    field :comment_added, :comment do
      arg :repo_name, non_null(:string)

      config fn args, _ ->
        {:ok, topic: args.repo_name}
      end

      trigger :submit_comment, topic: fn comment ->
        comment.content
      end

    end
  end
end
