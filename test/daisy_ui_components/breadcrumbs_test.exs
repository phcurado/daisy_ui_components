defmodule DaisyUIComponents.BreadcrumbsTest do
  use ExUnit.Case

  import Phoenix.Component
  import Phoenix.LiveViewTest
  import DaisyUIComponents.Breadcrumbs

  test "breadcrumbs with default slot" do
    assigns = %{}

    breadcrumbs =
      rendered_to_string(~H"""
      <.breadcrumbs class="text-sm">
        breadcrumb text
      </.breadcrumbs>
      """)

    assert breadcrumbs =~ ~s(<div class="breadcrumbs text-sm">)
    assert breadcrumbs =~ ~s(breadcrumb text)
  end

  test "breadcrumbs with item slot" do
    assigns = %{}

    breadcrumbs =
      rendered_to_string(~H"""
      <.breadcrumbs class="text-sm">
        <:item>home</:item>
        <:item path="/some-path">menu</:item>
        <:item icon="hero-settings-icon" path="/settings-path">Settings</:item>
      </.breadcrumbs>
      """)

    assert breadcrumbs =~ ~s(<div class="breadcrumbs text-sm">)
    assert breadcrumbs =~ ~s(<ul>)
    assert breadcrumbs =~ ~s(home)
    assert breadcrumbs =~ ~s(<span class="hero-settings-icon")
    assert breadcrumbs =~ ~s(<a href="/some-path")
    assert breadcrumbs =~ ~s(<a href="/settings-path")
  end
end
