defmodule Storybook.Welcome do
  use PhoenixStorybook.Story, :example

  use DaisyUIComponents

  alias Phoenix.LiveView.JS

  def doc do
    "Display example"
  end

  @impl true
  def mount(_params, _session, socket) do
    {:ok,
     assign(socket,
       current_id: 2,
       users: [
         %{id: 1, first_name: "Jose", last_name: "Valim", badge: "success"},
         %{
           id: 2,
           first_name: "Chris",
           last_name: "McCord",
           badge: "success"
         },
         %{
           id: 3,
           first_name: "Jose",
           last_name: "Valim",
           badge: "error"
         },
         %{
           id: 4,
           first_name: "Chris",
           last_name: "McCord",
           badge: "warning"
         }
       ]
     )}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <.drawer class="lg:drawer-open border" selector_id="drawer">
      <:drawer_content class="pb-10 b-1 bg-base-200">
        <.navbar class="bg-base-100 mb-5 shadow-xl">
          <div class="flex-1">
            <a class="btn btn-ghost text-xl">Phoenix + DaisyUI</a>
          </div>

          <div class="flex-none gap-2">
            <.swap animation="rotate">
              <input type="checkbox" class="theme-controller" value="synthwave" />
              <:swap_on type="icon" name="hero-sun" />
              <:swap_off type="icon" name="hero-moon" />
            </.swap>
            <div class="form-control">
              <.input type="text" placeholder="Search" bordered class="w-24 md:w-auto" />
            </div>
            <.dropdown align="end">
              <div tabindex="0" role="button" class="btn btn-ghost btn-circle avatar">
                <div class="w-10 rounded-full">
                  <img
                    alt="Tailwind CSS Navbar component"
                    src="https://img.daisyui.com/images/stock/photo-1534528741775-53994a69daeb.webp"
                  />
                </div>
              </div>
              <.menu
                tabindex="0"
                size="sm"
                class="dropdown-content bg-base-100 rounded-box z-[1] mt-3 w-52 p-2 shadow"
              >
                <:item>
                  <a class="justify-between">
                    Profile
                    <.badge>New</.badge>
                  </a>
                </:item>
                <:item><a>Settings</a></:item>
                <:item><a>Logout</a></:item>
              </.menu>
            </.dropdown>
          </div>
        </.navbar>
        <div class="px-10">
          <.breadcrumbs class="py-5">
            <:item icon="hero-home" path="#">
              Home
            </:item>
            <:item icon="hero-user" path="#">
              Users
            </:item>
          </.breadcrumbs>
          <div class="flex mb-5">
            <.stats class="w-full shadow">
              <.stat>
                <:figure class="text-primary"><.icon name="hero-heart" /></:figure>
                <:title>Downloads</:title>
                <:value class="text-primary">31K</:value>
                <:desc>Jan 1st - Feb 1st</:desc>
              </.stat>
              <.stat>
                <:figure class="text-secondary"><.icon name="hero-camera" /></:figure>
                <:title>Page Views</:title>
                <:value class="text-secondary">2.6M</:value>
                <:desc>21% more than last month</:desc>
              </.stat>
              <.stat>
                <:title>Users</:title>
                <:value>4,200</:value>
                <:desc>↗︎ 40 (2%)</:desc>
              </.stat>
              <.stat>
                <.stat_figure class="text-secondary">
                  <.avatar online>
                    <div class="w-16 rounded-full">
                      <img src="https://img.daisyui.com/images/stock/photo-1534528741775-53994a69daeb.webp" />
                    </div>
                  </.avatar>
                </.stat_figure>
                <.stat_value>86%</.stat_value>
                <.stat_title>Tasks done</.stat_title>
                <.stat_desc class="text-secondary">31 tasks remaining</.stat_desc>
              </.stat>
            </.stats>
          </div>
          <.card class="bg-base-100 shadow-xl">
            <:card_title>Users</:card_title>
            <:card_body>
              <div class="flex justify-end">
                <.button color="primary" phx-click={show_modal("new-user-modal")}>
                  Create user
                </.button>
              </div>
              <.table id="user-table" rows={@users}>
                <:col :let={user} label="Id">
                  {user.id}
                </:col>
                <:col :let={user} label="First name">
                  {user.first_name}
                </:col>
                <:col :let={user} label="Last name">
                  {user.last_name}
                </:col>
                <:col :let={user} label="Badge">
                  <.badge color={user.badge}>
                    {user.badge}
                  </.badge>
                </:col>
              </.table>
              <.pagination
                class="justify-center mt-5"
                size="md"
                page={1}
                total_entries={4}
                page_size={1}
              />
            </:card_body>
          </.card>
        </div>
        <.modal id="new-user-modal">
          <:modal_box>
            <.header>
              Create new user
              <:subtitle>This won't be persisted into DB, memory only</:subtitle>
            </.header>
            <.simple_form
              :let={f}
              for={%{}}
              as={:user}
              phx-submit={JS.push("save_user") |> hide_modal("new-user-modal")}
            >
              <.input field={f[:first_name]} label="First name" />
              <.input field={f[:last_name]} label="Last name" />
              <:actions>
                <.button>Save user</.button>
              </:actions>
            </.simple_form>
          </:modal_box>
        </.modal>
        <label for="my-drawer-2" class="btn btn-primary drawer-button lg:hidden">
          Open drawer
        </label>
      </:drawer_content>
      <:drawer_side class="h-full absolute border-r">
        <.menu class="bg-base-100 text-base-content min-h-full w-80 p-4">
          <:item>
            <h2 class="menu-title">Welcome</h2>
            <a><.icon name="hero-home" />Home</a>
          </:item>
          <:item>
            <details open>
              <summary><.icon name="hero-user" />Users</summary>
              <ul>
                <li><a class="active"><.icon name="hero-list-bullet" />List</a></li>
                <li><a><.icon name="hero-plus" />Create</a></li>
              </ul>
            </details>
          </:item>
          <:item><a><.icon name="hero-chart-bar" />Results</a></:item>
        </.menu>
      </:drawer_side>
    </.drawer>
    """
  end

  @impl true
  def handle_event("save_user", %{"user" => params}, socket) do
    user = %{
      first_name: params["first_name"],
      last_name: params["last_name"],
      badge: "success",
      id: socket.assigns.current_id + 1
    }

    {:noreply,
     socket
     |> update(:users, &(&1 ++ [user]))
     |> update(:current_id, &(&1 + 1))}
  end
end
