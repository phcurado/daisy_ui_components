defmodule Storybook.Components.Root do
  # See https://hexdocs.pm/phoenix_storybook/PhoenixStorybook.Index.html for full index
  # documentation.

  use PhoenixStorybook.Index

  def folder_icon, do: {:local, "hero-shopping-bag", "psb-w-4 psb-h-4"}
  def folder_name, do: "Components"
end
