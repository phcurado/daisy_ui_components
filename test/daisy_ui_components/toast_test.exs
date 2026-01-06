defmodule DaisyUIComponents.ToastTest do
  use ExUnit.Case

  import Phoenix.Component
  import Phoenix.LiveViewTest
  import DaisyUIComponents.Toast

  test "toast" do
    assigns = %{}

    assert rendered_to_string(~H"""
           <.toast>Content</.toast>
           """) =~ ~s(<div class="toast">)
  end

  test "toast horizontal alignment" do
    for horizontal <- ~w(start center end) do
      assigns = %{horizontal: horizontal}

      assert rendered_to_string(~H"""
             <.toast horizontal={@horizontal}>Content</.toast>
             """) =~ ~s(<div class="toast toast-#{horizontal}">)
    end
  end

  test "toast vertical alignment" do
    for vertical <- ~w(top middle bottom) do
      assigns = %{vertical: vertical}

      assert rendered_to_string(~H"""
             <.toast vertical={@vertical}>Content</.toast>
             """) =~ ~s(<div class="toast toast-#{vertical}">)
    end
  end

  test "toast combined position" do
    assigns = %{}

    assert rendered_to_string(~H"""
           <.toast horizontal="start" vertical="top">Content</.toast>
           """) =~ ~s(<div class="toast toast-start toast-top">)
  end
end
