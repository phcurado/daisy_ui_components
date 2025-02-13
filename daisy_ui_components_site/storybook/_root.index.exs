defmodule Storybook.Root do
  # See https://hexdocs.pm/phoenix_storybook/PhoenixStorybook.Index.html for full index
  # documentation.

  use PhoenixStorybook.Index

  def folder_icon, do: {:local, "hero-book-open", "psb-w-4 psb-h-4"}
  def folder_name, do: "🌻 DaisyUIComponents"

  def entry("welcome") do
    [
      name: "Welcome",
      icon: {:local, "hero-home", "psb-w-4 psb-h-4"}
    ]
  end

  def entry("setup") do
    [
      name: "Setup",
      icon: {:local, "hero-adjustments-horizontal", "psb-w-4 psb-h-4"}
    ]
  end
end
