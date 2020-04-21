defmodule ManageWeb.ModalComponent do
  use ManageWeb, :live_component

  @impl true
  def render(assigns) do
    ~L"""
    <div id="<%= @id %>" class="fixed bottom-0 inset-x-0 px-4 pb-4 sm:inset-0 sm:flex sm:items-center sm:justify-center"
      phx-capture-click="close"
      phx-window-keydown="close"
      phx-key="escape"
      phx-target="#<%= @id %>"
      phx-page-loading>
      <div class="fixed-inset-0 transition-opacity">
        <div class="absolute inset-0 bg-gray-500 opacity-75"></div>
      </div>
      <div class="phx-modal-content bg-white rounded-lg overflow-hidden shadow-xl transform transition-all sm:max-w-lg sm:w-full">
        <%= live_patch raw("&times;"), to: @return_to, class: "phx-modal-close" %>
        <%= live_component @socket, @component, @opts %>
      </div>
    </div>
    """
  end

  @impl true
  def handle_event("close", _, socket) do
    {:noreply, push_patch(socket, to: socket.assigns.return_to)}
  end
end
