defmodule LiveViewStudioWeb.SearchLive do
  use LiveViewStudioWeb, :live_view
  alias LiveViewStudio.Stores

  @doc "sets initial state"
  def mount(_params, _session, socket) do
    { :ok, assign(socket, [ zip: "", results: [] ]) }
  end

  #mock data in stores.ex
  def render(assigns) do
    ~L"""
    <h1>search stores</h1>

    <!-- nice pre included c s s -->
    <div id="search">
      <form phx-submit="zip_search">
        <input type="text" name="zip" value="<%= @zip %>" placeholder="zip code"
                autofocus/>

        <button type="submit"><img src="images/search.svg"/></button>
      </form>

      <div class="stores">
        <ul>
          <%= for store <- @results do %><li>
            <div class="first-line">
              <div class="name">
                <%= store.name %>
              </div>

              <div class="status">
                <%= if store.open do %>
                  <span class="open">Open</span>
                <% else %>
                  <span class="closed">Closed</span>
                <% end %>
              </div>
            </div>

            <div class="second-line">
              <div class="street">
                <img src="images/location.svg">
                <%= store.street %>
              </div>

              <div class="phone_number">
                <img src="images/phone.svg">
                <%= store.phone_number %>
              </div>
            </div>
          </li><% end %>
        </ul>
      </div>
    </div>
    """
  end

  def handle_event("zip_search", _, socket) do

  end
end
