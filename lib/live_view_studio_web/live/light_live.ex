defmodule LiveViewStudioWeb.LightLive do
  use LiveViewStudioWeb, :live_view #an-elixir process

  #called first auto. when request directed by-router
  @spec mount(params :: %{}, session :: any, socket :: Struct.t) :: any
  def mount(_params, _session, socket), do:
    { :ok, assign(socket, [brightness: 10]) } # |> IO.inspect
      # assigns :: %{ .... }, changed :: %{brightness: true}

  def render(assigns) do #a-liveview
    ~L"""
    <h1>available energy in-use</h1>
    <div id="light">
      <div class="meter"> <!-- pre included c s s animations for-change in-@brightness -->
        <span style="width: <%= @brightness %>%"><%= @brightness %>%</span>
      </div>

            <!-- name of-event; phx binds this event to-button on-click -->
      <button phx-click="off"><img src='images/light-off.svg'/></button>
      <button phx-click="decrease"><img src='images/down.svg'/></button>
      <button phx-click="increase"><img src='images/up.svg'/></button>
      <button phx-click="on"><img src='images/light-on.svg'/></button>
    </div>
    """
      # c s s pre included
  end

  def handle_event("off", _metadata, socket), do:
    { :noreply, assign(socket, :brightness, 0) }
      #saving re mounts live view

  def handle_event("decrease", _metadata, socket) do
    b = socket.assigns.brightness
    { :noreply, assign(socket, :brightness, if b == 0 do 0 else b - 10 end) }
  end

  def handle_event("increase", _metadata, socket) do
    b = socket.assigns.brightness
    { :noreply, assign(socket, :brightness, if b == 100 do 100 else b + 10 end) }
  end

  def handle_event("on", _metadata, socket) do
    { :noreply, assign(socket, :brightness, 100) }
  end
      # will- re -render phx sends only changes to-state to-client (kinda like-a-hook)
end
