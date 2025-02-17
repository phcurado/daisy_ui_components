defmodule Storybook.Components.Hero do
  use PhoenixStorybook.Story, :component

  alias DaisyUIComponents.Button
  alias DaisyUIComponents.Card
  alias DaisyUIComponents.Hero
  alias DaisyUIComponents.Input

  def function, do: &Hero.hero/1

  def imports, do: [{Button, button: 1}, {Card, card: 1}, {Input, input: 1}]

  def variations do
    [
      %Variation{
        id: :hero,
        attributes: %{
          class: "bg-base-200"
        },
        slots: [
          """
          <:content class="text-center">
            <div class="max-w-md">
              <h1 class="text-5xl font-bold">Hello there</h1>
              <p class="py-6">
                Provident cupiditate voluptatem et in. Quaerat fugiat ut assumenda excepturi exercitationem
                quasi. In deleniti eaque aut repudiandae et a id nisi.
              </p>
              <.button color="primary">Get Started</.button>
            </div>
          </:content>
          """
        ]
      },
      %Variation{
        id: :hero_image,
        attributes: %{
          class: "bg-base-200"
        },
        slots: [
          """
          <:content class="flex-col lg:flex-row">
            <img
              src="https://img.daisyui.com/images/stock/photo-1635805737707-575885ab0820.webp"
              class="max-w-sm rounded-lg shadow-2xl" />
            <div>
              <h1 class="text-5xl font-bold">Box Office News!</h1>
              <p class="py-6">
                Provident cupiditate voluptatem et in. Quaerat fugiat ut assumenda excepturi exercitationem
                quasi. In deleniti eaque aut repudiandae et a id nisi.
              </p>
              <.button color="primary">Get Started</.button>
            </div>
          </:content>
          """
        ]
      },
      %Variation{
        id: :hero_image_on_right_side,
        attributes: %{
          class: "bg-base-200"
        },
        slots: [
          """
          <:content class="flex-col lg:flex-row-reverse">
            <img
              src="https://img.daisyui.com/images/stock/photo-1635805737707-575885ab0820.webp"
              class="max-w-sm rounded-lg shadow-2xl" />
            <div>
              <h1 class="text-5xl font-bold">Box Office News!</h1>
              <p class="py-6">
                Provident cupiditate voluptatem et in. Quaerat fugiat ut assumenda excepturi exercitationem
                quasi. In deleniti eaque aut repudiandae et a id nisi.
              </p>
              <.button color="primary">Get Started</.button>
            </div>
          </:content>
          """
        ]
      },
      %Variation{
        id: :hero_with_login_form,
        attributes: %{
          class: "bg-base-200"
        },
        slots: [
          """
          <:content class="flex-col lg:flex-row-reverse">
            <div class="text-center lg:text-left">
              <h1 class="text-5xl font-bold">Login now!</h1>
              <p class="py-6">
                Provident cupiditate voluptatem et in. Quaerat fugiat ut assumenda excepturi exercitationem
                quasi. In deleniti eaque aut repudiandae et a id nisi.
              </p>
            </div>
            <.card class="bg-base-100 w-full max-w-sm shrink-0 shadow-2xl">
              <.form :let={f} for={%{}} as={:form}  class="card-body">
                <.input field={f[:email]} label="Email" placeholder="email" type="email" required />
                <.input field={f[:password]} label="Password" placeholder="password" type="password" required />
                <label class="label">
                  <a href="#" class="label-text-alt link link-hover">Forgot password?</a>
                </label>
                <div class="form-control mt-6">
                  <.button color="primary">Login</.button>
                </div>
              </.form>
            </.card>
          </:content>
          """
        ]
      },
      %Variation{
        id: :hero_with_overlay_image,
        attributes: %{
          style:
            ~s(background-image: url(https://img.daisyui.com/images/stock/photo-1507358522600-9f71e620c44e.webp)
        },
        slots: [
          """
          <:overlay class="bg-opacity-60"></:overlay>
          <:content class="text-neutral-content text-center">
            <div class="max-w-md">
              <h1 class="mb-5 text-5xl font-bold">Hello there</h1>
              <p class="mb-5">
                Provident cupiditate voluptatem et in. Quaerat fugiat ut assumenda excepturi exercitationem
                quasi. In deleniti eaque aut repudiandae et a id nisi.
              </p>
              <.button color="primary">Get Started</.button>
            </div>
          </:content>
          """
        ]
      }
    ]
  end
end
