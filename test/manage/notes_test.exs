defmodule Manage.NotesTest do
  use Manage.DataCase

  alias Manage.Notes

  describe "entries" do
    alias Manage.Notes.Entry

    @valid_attrs %{date: ~N[2010-04-17 14:00:00], name: "some name", note: "some note", tags: []}
    @update_attrs %{date: ~N[2011-05-18 15:01:01], name: "some updated name", note: "some updated note", tags: []}
    @invalid_attrs %{date: nil, name: nil, note: nil, tags: nil}

    def entry_fixture(attrs \\ %{}) do
      {:ok, entry} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Notes.create_entry()

      entry
    end

    test "list_entries/0 returns all entries" do
      entry = entry_fixture()
      assert Notes.list_entries() == [entry]
    end

    test "get_entry!/1 returns the entry with given id" do
      entry = entry_fixture()
      assert Notes.get_entry!(entry.id) == entry
    end

    test "create_entry/1 with valid data creates a entry" do
      assert {:ok, %Entry{} = entry} = Notes.create_entry(@valid_attrs)
      assert entry.date == ~N[2010-04-17 14:00:00]
      assert entry.name == "some name"
      assert entry.note == "some note"
      assert entry.tags == []
    end

    test "create_entry/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Notes.create_entry(@invalid_attrs)
    end

    test "update_entry/2 with valid data updates the entry" do
      entry = entry_fixture()
      assert {:ok, %Entry{} = entry} = Notes.update_entry(entry, @update_attrs)
      assert entry.date == ~N[2011-05-18 15:01:01]
      assert entry.name == "some updated name"
      assert entry.note == "some updated note"
      assert entry.tags == []
    end

    test "update_entry/2 with invalid data returns error changeset" do
      entry = entry_fixture()
      assert {:error, %Ecto.Changeset{}} = Notes.update_entry(entry, @invalid_attrs)
      assert entry == Notes.get_entry!(entry.id)
    end

    test "delete_entry/1 deletes the entry" do
      entry = entry_fixture()
      assert {:ok, %Entry{}} = Notes.delete_entry(entry)
      assert_raise Ecto.NoResultsError, fn -> Notes.get_entry!(entry.id) end
    end

    test "change_entry/1 returns a entry changeset" do
      entry = entry_fixture()
      assert %Ecto.Changeset{} = Notes.change_entry(entry)
    end
  end
end
