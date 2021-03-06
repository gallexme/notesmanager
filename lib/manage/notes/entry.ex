defmodule Manage.Notes.Entry do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "entries" do
    field :date, :naive_datetime
    field :name, :string
    field :note, :string
    field :tags, {:array, :string}

    timestamps()
  end

  def changeset(entry, %{"tags" => tags} = attrs) when is_binary(tags) do
    IO.inspect("SPLIT")

    tags =
      if is_list(tags) do
        tags
      else
        String.split(tags)
      end

    changeset(entry, %{attrs | "tags" => tags})
  end

  @doc false
  def changeset(entry, attrs) do
    IO.inspect(entry)
    IO.inspect(attrs)

    entry
    |> cast(attrs, [:name, :note, :date, :tags])
    |> validate_required([:name, :note, :date, :tags])
  end
end
