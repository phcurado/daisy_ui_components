defmodule DaisyUIComponents.Pagination do
  @moduledoc """
  Button Group component

  https://daisyui.com/components/pagination/


  """

  use DaisyUIComponents.Component

  import DaisyUIComponents.Button
  import DaisyUIComponents.ButtonGroup

  alias Phoenix.LiveView.JS

  @doc """
  Renders a button group.

  ## Examples

      <.pagination page={1} page_size={10} total_entries={100} />
  """
  attr :page, :integer, default: 1
  attr :page_size, :integer, default: 10
  attr :total_entries, :integer, default: 100
  attr :button_class, :string, default: nil
  attr :target, :string, default: nil
  attr :page_click_event, :string, default: "page_click"
  attr :rest, :global

  def pagination(assigns) do
    ~H"""
    <.button_group :if={@total_entries > 0} {@rest}>
      <%= for block <- calculate_display_btn(@page, @page_size, @total_entries) do %>
        <.button
          class={@button_class}
          phx-click={JS.push(@page_click_event, value: %{page: block})}
          phx-target={@target}
          active={block == @page}
          disabled={block == "..."}
        >
          <%= block %>
        </.button>
      <% end %>
    </.button_group>
    """
  end

  @max_display_block 7
  def calculate_display_btn(page, page_size, total_entries) do
    {max_blocks, _remain} =
      Float.ceil(total_entries / page_size) |> to_string() |> Integer.parse()

    cond do
      max_blocks <= @max_display_block ->
        Enum.map(1..max_blocks, & &1)

      page <= 4 ->
        Enum.map(1..5, & &1) ++ ["...", max_blocks]

      max_blocks - page <= 3 ->
        start_max_block_4 = max_blocks - 4
        [1, "..."] ++ Enum.map(start_max_block_4..max_blocks, & &1)

      true ->
        [1, "...", page - 1, page, page + 1, "...", max_blocks]
    end
  end
end
