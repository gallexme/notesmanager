defmodule Manage.Repo.Migrations.NotetextToMarkdown do
  use Ecto.Migration

  def change do
    alter table("entries") do
      modify :note, :text
    end
  end
end
