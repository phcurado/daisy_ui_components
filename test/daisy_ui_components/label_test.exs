defmodule DaisyUIComponents.LabelTest do
  use ExUnit.Case

  import Phoenix.Component
  import Phoenix.LiveViewTest
  import DaisyUIComponents.Label

  test "label" do
    assigns = %{}

    label =
      rendered_to_string(~H"""
      <.label>label slot</.label>
      """)

    assert label =~ ~s(<label class="label">)
    assert label =~ ~s(label slot)
  end

  test "label input" do
    assigns = %{}

    assert label =
             rendered_to_string(~H"""
             <.label type="input" text="input label">
               <input type="text" placeholder="URL" />
             </.label>
             """)

    assert label =~ ~s(<label class="input">)
    assert label =~ ~s(<span class="label">)
    assert label =~ ~s(input label)
    assert label =~ ~s(<input type="text" placeholder="URL">)
  end

  test "label select" do
    assigns = %{}

    assert label =
             rendered_to_string(~H"""
             <.label type="select" text="input label">
               <select />
             </.label>
             """)

    assert label =~ ~s(<label class="select">)
    assert label =~ ~s(<span class="label">)
    assert label =~ ~s(input label)
    assert label =~ ~s(<select>)
  end

  test "label floating" do
    assigns = %{}

    assert label =
             rendered_to_string(~H"""
             <.label type="floating" text="Your email">
               <input type="text" placeholder="mail@site.com" class="input input-md" />
             </.label>
             """)

    assert label =~ ~s(<label class="floating-label">)
    assert label =~ ~s(<span class="">)
    assert label =~ ~s(Your email)
    assert label =~ ~s(<input type="text" placeholder="mail@site.com" class="input input-md">)
  end

  test "label positions" do
    assigns = %{}

    assert label =
             rendered_to_string(~H"""
             <.label type="input" text=".com" position="end">
               <input type="text" placeholder="domain name" />
             </.label>
             """)

    {:ok, document} = Floki.parse_document(label)
    [{"label", _attr, child}] = Floki.find(document, "label")
    # assert order of elements
    assert [{"input", _, _}, {"span", _, _}] = child

    assert label =~ ~s(<label class="input">)
    assert label =~ ~s(<span class="label">)
    assert label =~ ~s(<input type="text" placeholder="domain name">)
  end
end
