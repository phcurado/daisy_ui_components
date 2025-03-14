defmodule Storybook.Components.Footer do
  use PhoenixStorybook.Story, :component

  alias DaisyUIComponents.Button
  alias DaisyUIComponents.Fieldset
  alias DaisyUIComponents.Footer
  alias DaisyUIComponents.Icon
  alias DaisyUIComponents.Input
  alias DaisyUIComponents.Join
  alias DaisyUIComponents.Label

  def function, do: &Footer.footer/1

  def imports,
    do: [
      {Button, button: 1},
      {Fieldset, fieldset: 1},
      {Footer, footer_title: 1},
      {Icon, icon: 1},
      {Input, input: 1},
      {Join, join: 1},
      {Label, label: 1}
    ]

  defp common_slot do
    """
    <nav>
      <.footer_title>Services</.footer_title>
      <a class="link link-hover">Branding</a>
      <a class="link link-hover">Design</a>
      <a class="link link-hover">Marketing</a>
      <a class="link link-hover">Advertisement</a>
    </nav>
    <nav>
      <.footer_title>Company</.footer_title>
      <a class="link link-hover">About us</a>
      <a class="link link-hover">Contact</a>
      <a class="link link-hover">Jobs</a>
      <a class="link link-hover">Press kit</a>
    </nav>
    <nav>
      <.footer_title>Legal</.footer_title>
      <a class="link link-hover">Terms of use</a>
      <a class="link link-hover">Privacy policy</a>
      <a class="link link-hover">Cookie policy</a>
    </nav>
    """
  end

  def variations do
    [
      %Variation{
        id: :footer,
        attributes: %{
          class: "sm:footer-horizontal bg-neutral text-neutral-content p-10"
        },
        slots: [
          """
          #{common_slot()}
          """
        ]
      },
      %Variation{
        id: :footer_with_logo,
        attributes: %{
          class: "sm:footer-horizontal bg-neutral text-neutral-content p-10"
        },
        slots: [
          """
          <aside>
            <.icon name="hero-device-phone-mobile" />
            <p>
              Industries Ltd.
              <br />
              1992
            </p>
          </aside>
          #{common_slot()}
          """
        ]
      },
      %Variation{
        id: :footer_with_form,
        attributes: %{
          class: "sm:footer-horizontal bg-neutral text-neutral-content p-10"
        },
        slots: [
          """
          #{common_slot()}
          <form>
            <.footer_title>Newsletter</.footer_title>
            <.fieldset class="w-80">
              <.label>Enter your email address</.label>
              <.join>
              <.input
                type="text"
                placeholder="username@site.com"
                class="join-item" />
              <.button class="join-item" color="primary">Subscribe</.button>
              </.join>
            </.fieldset>
          </form>
          """
        ]
      },
      %Variation{
        id: :footer_copyright_text,
        attributes: %{
          class: "sm:footer-horizontal footer-center bg-base-300 text-base-content p-4"
        },
        slots: [
          """
          <aside>
            <p>Copyright © 2025 - All right reserved by ACME Industries Ltd</p>
          </aside>
          """
        ]
      },
      %Variation{
        id: :footer_with_two_rows,
        attributes: %{
          class: "sm:footer-horizontal bg-neutral text-neutral-content grid-rows-2 p-10"
        },
        slots: [
          """
          #{common_slot()}
          #{common_slot()}
          """
        ]
      },
      %Variation{
        id: :footer_horizontal_centered,
        attributes: %{
          direction: "horizontal",
          placement: "center",
          class: "bg-primary text-primary-content p-10"
        },
        slots: [
          """
          #{common_slot()}
          """
        ]
      }
    ]
  end
end
