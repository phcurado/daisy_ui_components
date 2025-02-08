defmodule Storybook.MyPage do
  # See https://hexdocs.pm/phoenix_storybook/PhoenixStorybook.Story.html for full story
  # documentation.
  use PhoenixStorybook.Story, :page

  # This is a dummy fonction that you should replace with your own HEEx content.
  def render(assigns) do
    assigns =
      assign(assigns,
        install_content: render_markdown()
      )

    ~H"""
    <div class="psb-welcome-page psb-border-t psb-border-gray-200 psb-pt-4">
      {Phoenix.HTML.raw(@install_content)}
    </div>
    """
  end

  defp render_markdown() do
    path = Path.expand("../guides/install.md", __DIR__)
    guide = Path.basename(path)
    markdown = File.read!(path)
    {:ok, html_guide, _} = Earmark.as_html(markdown)
    html_guide
  end
end
