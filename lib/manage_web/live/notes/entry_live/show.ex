defmodule ManageWeb.Notes.EntryLive.Show do
  use ManageWeb, :live_view

  alias Manage.Notes

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:entry, Notes.get_entry!(id))}
  end

  defp from_markdown(string), do: Earmark.as_html!(string)
  defp page_title(:show), do: "Show Entry"
  defp page_title(:edit), do: "Edit Entry"
end
