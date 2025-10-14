defmodule Storybook.Components.Accordion do
  use PhoenixStorybook.Story, :component

  alias DaisyUIComponents.Accordion

  def function, do: &Accordion.accordion/1

  def variations do
    [
      %VariationGroup{
        id: :basic_accordion,
        variations: variations_template()
      }
    ]
  end

  defp variations_template do
    [
      %Variation{
        id: :accordion_1,
        attributes: %{
          name: "accordion",
          class: "bg-base-100 border border-base-300"
        },
        slots: [
          """
          <:title>How do I create an account?</:title>
          <:content>Click the "Sign Up" button in the top right corner and follow the registration process.</:content>
          """
        ]
      },
      %Variation{
        id: :accordion_2,
        attributes: %{
          name: "accordion",
          class: "bg-base-100 border border-base-300"
        },
        slots: [
          """
          <:title>I forgot my password. What should I do?</:title>
          <:content>Click on "Forgot Password" on the login page and follow the instructions sent to your email.</:content>
          """
        ]
      },
      %Variation{
        id: :accordion_3,
        attributes: %{
          name: "accordion",
          class: "bg-base-100 border border-base-300"
        },
        slots: [
          """
          <:title>How do I update my profile information?</:title>
          <:content>Go to "My Account" settings and select "Edit Profile" to make changes.</:content>
          """
        ]
      }
    ]
  end
end
