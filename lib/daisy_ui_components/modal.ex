defmodule DaisyUIComponents.Modal do
  @moduledoc """
  Modal component

  https://daisyui.com/components/modal/

  """

  use DaisyUIComponents.Component

  alias Phoenix.LiveView.JS

  @doc """
  Renders a dialog modal.

  ## Examples

      <.modal id="confirm-modal">
        <.modal_box>
          This is a modal
        </.modal_box>
      </.modal>

  JS commands may be passed to the `:on_cancel` to configure
  the closing/cancel event, for example:

      <.modal id="confirm" on_cancel={JS.navigate(~p"/posts")}>
        <.modal_box>
          This is another modal
        </.modal_box>
      </.modal>

  dialog with slots and actions:

      <.modal id="confirm">
        <:modal_box class="w-11/12 max-w-5xl">
          Modal to confirm
          <:actions>
            <.button>Confirm</.button>
          <:actions>
        </:modal_box>
      </.modal>
  """
  attr :id, :string, required: true
  attr :class, :string, default: nil
  attr :open, :boolean, default: false

  attr :show, :boolean,
    default: nil,
    doc:
      "Behaves like `open` attribute. This attribute exist to avoid compatibility issues with phoenix core components"

  attr :closeable, :boolean, default: true
  attr :close_on_click_away, :boolean, default: false

  attr :rest, :global
  attr :on_cancel, JS, default: %JS{}

  slot :modal_box, doc: "the slot for compacting the modal body" do
    attr :class, :string
    attr :content_class, :string
  end

  slot :inner_block

  def modal(assigns) do
    assigns =
      assigns
      |> assign(:open, assigns[:show] || assigns[:open])

    ~H"""
    <dialog
      id={@id}
      class={["modal", @class]}
      phx-mounted={@open && show_modal(@id)}
      phx-remove={hide_modal(@id)}
      data-cancel={JS.exec(@on_cancel, "phx-remove")}
      {@rest}
    >
      <.modal_box
        :for={modal_box <- @modal_box}
        class={modal_box[:class]}
        content_class={modal_box[:content_class]}
        closeable={@closeable}
        close_on_click_away={@close_on_click_away}
        modal_id={@id}
      >
        {render_slot(modal_box)}
      </.modal_box>

      {render_slot(@inner_block)}
    </dialog>
    """
  end

  attr :modal_id, :string, required: true
  attr :class, :string, default: nil
  attr :content_class, :string, default: nil
  attr :closeable, :boolean, default: true
  attr :close_on_click_away, :boolean, default: false
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
      phx-click-away={@close_on_click_away && JS.exec("data-cancel", to: "##{@modal_id}")}
    >
      <form :if={@closeable} method="dialog">
        <button
          phx-click={JS.exec("data-cancel", to: "##{@modal_id}")}
          class="btn btn-sm btn-circle btn-ghost absolute right-2 top-2"
        >
          ✕
        </button>
      </form>
      <div id={"#{@modal_id}-content"} class={@content_class}>
        {render_slot(@inner_block)}
      </div>

      <.modal_action :for={action <- @actions}>
        {render_slot(action)}
      </.modal_action>
    </.focus_wrap>
    """
  end

  attr :class, :string, default: nil
  slot :inner_block

  def modal_action(assigns) do
    ~H"""
    <div class={["modal-action", @class]}>
      {render_slot(@inner_block)}
    </div>
    """
  end

  def show_modal(js \\ %JS{}, id) when is_binary(id) do
    js
    |> JS.set_attribute({"open", "true"}, to: "##{id}")
    |> JS.focus_first(to: "##{id}-content")
  end

  def hide_modal(js \\ %JS{}, id) do
    js
    |> JS.remove_attribute("open", to: "##{id}")
    |> JS.pop_focus()
  end
end
