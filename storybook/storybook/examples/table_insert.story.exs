defmodule Storybook.Examples.TableInsert do
  use PhoenixStorybook.Story, :example

  use DaisyUIComponents

  alias DaisyUIComponents.Table
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
       sorted_columns: [{"id", "asc"}]
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
      <:col :let={user} sort_key={:id} label="Id">
        {user.id}
      </:col>
      <:col :let={user} sort_key={:first_name} label="First name">
        {user.first_name}
      </:col>
      <:col :let={user} label="Last name">
        {user.last_name}
      </:col>
    </.table>
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
    sorted_columns = Table.update_sort(socket.assigns.sorted_columns, sort_key, sort_direction)

    {:noreply,
     socket
     |> assign(:users, sort_users(socket.assigns.users, sorted_columns))
     |> assign(:sorted_columns, sorted_columns)}
  end

  defp sort_users(users, sorted_columns) do
    Enum.reduce(sorted_columns, users, fn {key, direction}, acc ->
      direction =
        case direction do
          "asc" -> :asc
          "desc" -> :desc
          _ -> nil
        end

      case {key, direction} do
        {_key, nil} ->
          acc

        {"id", direction} ->
          Enum.sort_by(acc, & &1.id, direction)

        {"first_name", direction} ->
          Enum.sort_by(acc, & &1.first_name, direction)

        _ ->
          acc
      end
    end)
  end
end
