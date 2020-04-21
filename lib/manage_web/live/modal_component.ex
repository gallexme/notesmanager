defmodule ManageWeb.ModalComponent do
  use ManageWeb, :live_component

  @impl true
  def render(assigns) do
    ~L"""
    <div id="<%= @id %>" class=" fixed bottom-0 inset-x-0 px-4 pt-16 pb-16 sm:inset-0 sm:flex sm:items-center sm:justify-center"
      phx-capture-click="close"
      phx-window-keydown="close"
      phx-key="escape"
      phx-target="#<%= @id %>"
      phx-page-loading>
      <div class="fixed-inset-0 transition-opacity">
        <div class="absolute inset-0 bg-gray-500 opacity-75"></div>
      </div>
      <div class="p-2 py-4   shadow-2xl bg-gray-300 rounded overflow-hidden  transform transition-all sm:max-w-lg sm:w-full">
        <%= live_patch raw("&times;"), to: @return_to, class: "hover:bg-red-500 bg-red-400 py-2  px-4" %>
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
