defmodule Storybook.MyPage do
  # See https://hexdocs.pm/phoenix_storybook/PhoenixStorybook.Story.html for full story
  # documentation.
  use PhoenixStorybook.Story, :page

  def doc, do: "DaisyUI + Phoenix LiveView"

  # Declare an optional tab-based navigation in your page:
  def navigation do
    [
      {:welcome, "Welcome", {:fa, "hand-wave", :thin}},
      {:components, "Components", {:fa, "toolbox", :thin}},
      {:sandboxing, "Sandboxing", {:fa, "box-check", :thin}},
      {:icons, "Icons", {:fa, "icons", :thin}}
    ]
  end

  # This is a dummy fonction that you should replace with your own HEEx content.
  def render(assigns = %{tab: :welcome}) do
    markdown =
      Application.app_dir(:daisy_ui_components_site, "priv/static/README.md")
      |> File.read!()

    {:ok, html_guide, _} = Earmark.as_html(markdown)
    assigns = assigns |> assign(:install_content, html_guide)

    ~H"""
    <div class="psb-welcome-page">
      <p>
        This storybook was was generated with <a
          class="link"
          href="https://github.com/phenixdigital/phoenix_storybook"
        >Phoenix Storybook</a>.
        Explore this library by navigating in the sidebar menu.
      </p>

      {Phoenix.HTML.raw(@install_content)}

      <p>
        This should be enough to get you started, but you can use the tabs in the upper-right corner of this page to <strong>check out advanced usage guides</strong>.
      </p>
    </div>
    """
  end

  def render(assigns = %{tab: guide}) when guide in ~w(components sandboxing icons)a do
    assigns =
      assign(assigns,
        guide: guide,
        guide_content: PhoenixStorybook.Guides.markup("#{guide}.md")
      )

    ~H"""
    <p class="md:psb-text-lg psb-leading-relaxed psb-text-slate-400 psb-w-full psb-text-left psb-mb-4 psb-mt-2 psb-italic">
      <a
        class="hover:text-indigo-700"
        href={"https://hexdocs.pm/phoenix_storybook/#{@guide}.html"}
        target="_blank"
      >
        This and other guides are also available on HexDocs.
      </a>
    </p>
    <div class="psb-welcome-page psb-border-t psb-border-gray-200 psb-pt-4">
      {Phoenix.HTML.raw(@guide_content)}
    </div>
    """
  end
end
