defmodule Storybook.Examples.TableInsert do
  use PhoenixStorybook.Story, :example

  use DaisyUIComponents

  alias Phoenix.LiveView.JS

  def doc do
    "An example of what you can achieve with DaisyUI Core Components."
  end

  defstruct [:id, :first_name, :last_name]

  @impl true
  def mount(_params, _session, socket) do
    {:ok,
     assign(socket,
       current_id: 2,
       users: [
         %__MODULE__{id: 1, first_name: "Jose", last_name: "Valim"},
         %__MODULE__{
           id: 2,
           first_name: "Chris",
           last_name: "McCord"
         }
       ],
       sorted_columns: []
     )}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <.header>
      List of users
      <:subtitle>Feel free to add any missing user!</:subtitle>
      <:actions>
        <.button phx-click={show_modal("new-user-modal")}>Create user</.button>
      </:actions>
    </.header>
    <.table id="user-table" rows={@users} sorted_columns={@sorted_columns}>
      <:col :let={user} sort_key={:id} sort_direction="asc" label="Id">
        {user.id}
      </:col>
      <:col :let={user} label="First name">
        {user.first_name}
      </:col>
      <:col :let={user} label="Last name">
        {user.last_name}
      </:col>
    </.table>
    <.pagination size="xs" page={2} total_entries={4} page_size={1} />
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
    """
  end

  @impl true
  def handle_event("save_user", %{"user" => params}, socket) do
    user = %__MODULE__{
      first_name: params["first_name"],
      last_name: params["last_name"],
      id: socket.assigns.current_id + 1
    }

    {:noreply,
     socket
     |> update(:users, &(&1 ++ [user]))
     |> update(:current_id, &(&1 + 1))}
  end

  def handle_event("sort", %{"sort_key" => sort_key, "sort_direction" => sort_direction}, socket) do
    direction =
      case sort_direction do
        "asc" -> :asc
        "desc" -> :desc
        _ -> :asc
      end

    {key, sorted_users} =
      case sort_key do
        "id" -> {:id, sort_by_id(socket.assigns.users, direction)}
        _ -> {nil, socket.assigns.users}
      end

    {:noreply,
     socket
     |> assign(:users, sorted_users)
     |> assign(
       :sorted_columns,
       map_sorted_columns(socket.assigns.sorted_columns, {key, direction})
     )}
    |> IO.inspect()
  end

  defp sort_by_id(users, direction) do
    Enum.sort_by(users, & &1.id, direction)
  end

  defp map_sorted_columns(sorted_columns, {key, direction}) do
    if Enum.find(sorted_columns, fn {k, _} -> k == key end) do
      Enum.map(sorted_columns, fn
        {^key, _} -> {key, direction}
        other -> other
      end)
    else
      [{key, direction} | sorted_columns]
    end
  end
end
