defmodule DaisyUIComponents.Loading do
  use DaisyUIComponents.Component

  alias Phoenix.LiveView.JS

  attr :id, :string, required: true
  attr :loading, :boolean, default: false
  attr :loading_type, :string, required: true

  def loading(assigns) do
    ~H"""
    <span id={@id} class={"loading #{@loading_type}"}></span>
    """
  end
end
