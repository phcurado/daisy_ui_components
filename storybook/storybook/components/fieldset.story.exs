defmodule Storybook.Components.Fieldset do
  use PhoenixStorybook.Story, :component

  alias DaisyUIComponents.Button
  alias DaisyUIComponents.Fieldset
  alias DaisyUIComponents.Input
  alias DaisyUIComponents.Join

  def function, do: &Fieldset.fieldset/1

  def imports,
    do: [
      {Fieldset, [fieldset_legend: 1]},
      {Fieldset, [fieldset_label: 1]},
      {Input, [input: 1]},
      {Button, [button: 1]},
      {Join, [join: 1]}
    ]

  def variations do
    [
      %Variation{
        id: :fieldset_with_legend_and_label,
        slots: [
          """
          <.fieldset_legend>Page title</.fieldset_legend>
          <.input type="text" placeholder="My awesome page" />
          <.fieldset_label>You can edit page title later on from settings</.fieldset_label>
          """
        ]
      },
      %Variation{
        id: :fieldset_with_background_and_color,
        attributes: %{class: "w-xs bg-base-200 border border-base-300 p-4 rounded-box"},
        slots: [
          """
          <.fieldset_legend>Page title</.fieldset_legend>
          <.input type="text" placeholder="My awesome page" />
          <.fieldset_label>You can edit page title later on from settings</.fieldset_label>
          """
        ]
      },
      %Variation{
        id: :fieldset_with_multiple_inputs,
        attributes: %{class: "w-xs bg-base-200 border border-base-300 p-4 rounded-box"},
        slots: [
          """
          <.fieldset_legend>Page Details</.fieldset_legend>

          <.fieldset_label>Title</.fieldset_label>
          <.input type="text" placeholder="My awesome page" />

          <.fieldset_label>Slug</.fieldset_label>
          <.input type="text" placeholder="my-awesome-page" />

          <.fieldset_label class="fieldset-label">Author</.fieldset_label>
          <.input type="text" placeholder="Name" />
          """
        ]
      },
      %Variation{
        id: :fieldset_with_multiple_join_items,
        attributes: %{class: "w-xs bg-base-200 border border-base-300 p-4 rounded-box"},
        slots: [
          """
          <.fieldset_legend>Settings</.fieldset_legend>

          <.join>
            <.input type="text" class="join-item" placeholder="Product Name" />
            <.button class="join-item">Save</.button>
          </.join>
          """
        ]
      },
      %Variation{
        id: :login_form_with_fieldset,
        attributes: %{class: "w-xs bg-base-200 border border-base-300 p-4 rounded-box"},
        slots: [
          """
          <.fieldset_legend>Login</.fieldset_legend>

          <.fieldset_label>Email</.fieldset_label>
          <.input type="email" placeholder="Email" />

          <.fieldset_label>Password</.fieldset_label>
          <.input type="password" placeholder="Password" />

          <.button class="btn btn-primary mt-4">Login</.button>
          """
        ]
      }
    ]
  end
end
