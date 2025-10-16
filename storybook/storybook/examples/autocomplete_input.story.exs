defmodule Storybook.Examples.AutocompleteInput do
  use PhoenixStorybook.Story, :example
  use DaisyUIComponents

  def doc do
    "An example of how to use the autocomplete input within a form to search for a car model from a list of options."
  end

  @car_models Enum.with_index([
                "Toyota Corolla",
                "Honda Civic",
                "Ford Mustang",
                "Chevrolet Camaro",
                "Tesla Model 3",
                "BMW 3 Series",
                "Audi A4",
                "Hyundai Elantra",
                "Volkswagen Golf",
                "Nissan Altima"
              ])

  @impl true
  def render(assigns) do
    ~H"""
    <.flash_group flash={@flash} />
    <.simple_form for={@form} phx-change="validate" phx-submit="save">
      <.input
        type="autocomplete"
        field={@form[:model_id]}
        options={@models}
        on_query="filter-models"
        label="Model"
      />
      <:actions>
        <.button>Save</.button>
      </:actions>
    </.simple_form>
    """
  end

  @impl true
  def mount(_params, _session, socket) do
    {:ok,
     socket
     |> assign(:form, to_form(%{"model_id" => nil}, as: :car))
     |> assign(:models, @car_models)}
  end

  @impl true
  def handle_event("filter-models", %{"car_model_id_label" => query}, socket) do
    models =
      Enum.filter(@car_models, fn {name, _id} ->
        String.downcase(name) =~ String.downcase(query)
      end)

    {:noreply, assign(socket, :models, models)}
  end

  def handle_event("validate", %{"car" => car_params}, socket) do
    {:noreply, assign(socket, :form, to_form(car_params, as: :car, action: :validate))}
  end

  def handle_event("save", %{"car" => car_params}, socket) do
    case car_params["model_id"] do
      "" ->
        form =
          to_form(car_params, as: :car, action: :save, errors: [model_id: {"Can't be blank", []}])

        {:noreply, assign(socket, :form, form)}

      model_id ->
        form = to_form(car_params, as: :car, action: :save)

        {:noreply,
         socket
         |> assign(:form, form)
         |> put_flash(:info, "Car ID #{model_id} saved!")}
    end
  end
end
