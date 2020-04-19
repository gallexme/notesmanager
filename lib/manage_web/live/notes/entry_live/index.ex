defmodule ManageWeb.Notes.EntryLive.Index do
  use ManageWeb, :live_view

  alias Manage.Notes
  alias Manage.Notes.Entry

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, :entries, fetch_entries())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Entry")
    |> assign(:entry, Notes.get_entry!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Entry")
    |> assign(:entry, %Entry{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Entries")
    |> assign(:entry, nil)
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    entry = Notes.get_entry!(id)
    {:ok, _} = Notes.delete_entry(entry)

    {:noreply, assign(socket, :entries, fetch_entries())}
  end

  defp fetch_entries do
    Notes.list_entries()
  end
end
