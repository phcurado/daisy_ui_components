defmodule DaisyUIComponents.PaginationTest do
  use DaisyUIComponents.IntegrationCase

  import Phoenix.Component

  import DaisyUIComponents.Pagination

  test "pagination" do
    assigns = %{page: 1, page_size: 10, total_entries: 100}

    template = ~H"""
    <.pagination />
    """

    pagination = rendered_to_string(template)

    assert pagination =~ ~s(<div class="join">)
    assert pagination =~ ~s(<button class="btn join-item")
    assert pagination =~ ~s(<button class="btn btn-active join-item")
    assert pagination =~ ~s(<button class="btn btn-disabled join-item")
  end

  test "triggers event on page click", %{conn: conn} do
    defmodule PageLive do
      use Phoenix.LiveView
      import DaisyUIComponents.Pagination

      def render(assigns) do
        ~H"""
        <p>Current page: {@page}</p>
        <.pagination page={@page} page_size={10} total_entries={100} />
        """
      end

      def mount(_params, _session, socket) do
        {:ok, assign(socket, :page, 1)}
      end

      def handle_event("page_click", %{"page" => page}, socket) do
        {:noreply, assign(socket, :page, page)}
      end
    end

    {:ok, view, html} = live_isolated(conn, PageLive)

    html =~ "Current page: 1"
    assert render_click(element(view, "button", "2")) =~ "Current page: 2"
  end

  test "calculate_display_btn" do
    assert [1, 2] == calculate_display_btn(1, 10, 20)
    assert [1, 2, 3, 4] == calculate_display_btn(1, 10, 40)
    assert [1, 2, 3, 4, 5, 6] == calculate_display_btn(1, 10, 60)

    assert [1, 2, 3, 4, 5, 6, 7] == calculate_display_btn(1, 10, 70)
    assert [1, 2, 3, 4, 5, 6, 7] == calculate_display_btn(4, 10, 70)

    assert [1, 2, 3, 4, 5, "...", 8] == calculate_display_btn(1, 10, 80)
    assert [1, 2, 3, 4, 5, "...", 8] == calculate_display_btn(2, 10, 80)
    assert [1, 2, 3, 4, 5, "...", 8] == calculate_display_btn(4, 10, 80)
    assert [1, "...", 4, 5, 6, 7, 8] == calculate_display_btn(5, 10, 80)

    assert [1, 2, 3, 4, 5, "...", 10] == calculate_display_btn(4, 10, 100)
    assert [1, "...", 4, 5, 6, "...", 10] == calculate_display_btn(5, 10, 100)
    assert [1, "...", 6, 7, 8, 9, 10] == calculate_display_btn(7, 10, 100)
    assert [1, "...", 6, 7, 8, 9, 10] == calculate_display_btn(9, 10, 100)
  end
end
