defmodule LiveViewStudioWeb.LightLive do
  use LiveViewStudioWeb, :live_view

  #called first auto. when request directed by-router
  @spec mount(params :: %{}, session :: any, socket :: Struct.t) :: any
  def mount(_params, _session, socket) do
    { :ok, assign(socket, [brightness: 10]) } # |> IO.inspect
      # assigns :: %{ .... }, changed :: %{brightness: true}
  end

  def render(assigns) do #a-liveview
    ~L"""
    <h1>screen brightness</h1>
    <%= @brightness %>
    """
  end
end
