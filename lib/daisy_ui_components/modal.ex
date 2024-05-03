defmodule DaisyUIComponents.Modal do
  @moduledoc """
  Modal component

  https://daisyui.com/components/modal/

  """

  use DaisyUIComponents.Component

  alias Phoenix.LiveView.JS

  @doc """
  Renders a modal.

  ## Examples

      <.modal id="confirm-modal">
        This is a modal.
      </.modal>

  JS commands may be passed to the `:on_cancel` to configure
  the closing/cancel event, for example:

      <.modal id="confirm" on_cancel={JS.navigate(~p"/posts")}>
        This is another modal.
      </.modal>

  Modal with actions:

      <.modal id="confirm">
        Modal to confirm
        <:actions>
          <.button>Confirm</.button>
        <:actions>
      </.modal>
  """
  attr :id, :string, required: true
  attr :open, :boolean, default: false
  attr :rest, :global
  attr :on_cancel, JS, default: %JS{}
  slot :actions, doc: "the slot for showing modal actions"
  slot :inner_block

  def modal(assigns) do
    assigns = join_classes_with_rest(assigns, ["modal modal-bottom sm:modal-middle"])

    ~H"""
    <div
      id={@id}
      phx-mounted={@open && show_modal(@id)}
      phx-remove={hide_modal(@id)}
      data-cancel={JS.exec(@on_cancel, "phx-remove")}
      {@rest}
    >
      <.focus_wrap
        id={"#{@id}-container"}
        class="modal-box relative"
        phx-window-keydown={JS.exec("data-cancel", to: "##{@id}")}
        phx-key="escape"
        phx-click-away={JS.exec("data-cancel", to: "##{@id}")}
      >
        <label
          phx-click={JS.exec("data-cancel", to: "##{@id}")}
          class="btn btn-sm btn-circle absolute right-2 top-2"
        >
          ✕
        </label>
        <div id={"#{@id}-content"}>
          <%= render_slot(@inner_block) %>
        </div>
        <div class="modal-action">
          <%= for action <- @actions do %>
            <%= render_slot(action) %>
          <% end %>
        </div>
      </.focus_wrap>
    </div>
    """
  end

  @doc """
  Renders a dialog modal.

  ## Examples

      <.dialog_modal id="confirm-modal">
        <.modal_box>
          This is a modal
        </.modal_box>
      </.dialog_modal>

  JS commands may be passed to the `:on_cancel` to configure
  the closing/cancel event, for example:

      <.modal id="confirm" on_cancel={JS.navigate(~p"/posts")}>
        <.modal_box>
          This is another modal
        </.modal_box>
      </.modal>

  dialog with actions:

      <.dialog_modal id="confirm">
        <.modal_box>
          Modal to confirm
        </.modal_box>
        <:actions>
          <.button>Confirm</.button>
        <:actions>
      </.dialog_modal>
  """
  attr :id, :string, required: true
  attr :class, :string, default: nil
  attr :open, :boolean, default: false
  attr :rest, :global
  attr :on_cancel, JS, default: %JS{}
  slot :inner_block

  def dialog_modal(assigns) do
    ~H"""
    <dialog
      id={@id}
      class={["modal", @class]}
      phx-mounted={@open && show_modal(@id)}
      phx-remove={hide_modal(@id)}
      data-cancel={JS.exec(@on_cancel, "phx-remove")}
      {@rest}
    >
      <%= render_slot(@inner_block) %>
    </dialog>
    """
  end

  attr :modal_id, :string, required: true
  attr :class, :string, default: nil
  attr :closable, :boolean, default: true
  attr :rest, :global
  slot :inner_block
  slot :actions, doc: "the slot for showing modal actions"

  def modal_box(assigns) do
    ~H"""
    <.focus_wrap
      id={"#{@modal_id}-container"}
      class={["modal-box", @class]}
      phx-window-keydown={JS.exec("data-cancel", to: "##{@modal_id}")}
      phx-key="escape"
      phx-click-away={JS.exec("data-cancel", to: "##{@modal_id}")}
    >
      <label
        :if={@closable}
        phx-click={JS.exec("data-cancel", to: "##{@modal_id}")}
        class="btn btn-sm btn-circle absolute right-2 top-2"
      >
        ✕
      </label>
      <div id={"#{@modal_id}-content"}>
        <%= render_slot(@inner_block) %>
      </div>

      <.modal_action :for={action <- @actions}>
        <%= render_slot(action) %>
      </.modal_action>
    </.focus_wrap>
    """
  end

  attr :class, :string, default: nil
  slot :inner_block

  def modal_action(assigns) do
    ~H"""
    <div class={["modal-action", @class]}>
      <%= render_slot(@inner_block) %>
    </div>
    """
  end

  def show_modal(js \\ %JS{}, id) when is_binary(id) do
    js
    |> JS.add_class("modal-open", to: "##{id}")
    |> JS.focus_first(to: "##{id}-content")
  end

  def hide_modal(js \\ %JS{}, id) do
    js
    |> JS.remove_class("modal-open", to: "##{id}")
    |> JS.pop_focus()
  end
end
