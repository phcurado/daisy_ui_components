## Installation

Reference this repository on your `mix.exs` file to start using.

```elixir
def deps do
  [
    {:daisy_ui_components, "~> 0.1"}
  ]
end
```

Add through `npm` the daisy UI package inside your phoenix application:

```
cd assets
npm i -D daisyui@latest
```

On `tailwind.config.js` include Live DaisyUI Components under the content list and reference under plugins

```javascript
module.exports = {
  content: [
    //...
    "../deps/daisy_ui_components/**/*.*ex" // <- reference DaisyUIComponents as content path
  ],
  //...
  plugins: [
    //...
    require("daisyui")  <- // add daisyUI plugin
    //...
  ]
}
```

Add error translation function to your app's config.exs file. This function is used to translate ecto changeset errors

```elixir
config :daisy_ui_components, translate_function: &MyAppWeb.CoreComponents.translate_error/1
```

And now this library is ready. To have the components available under liveview, import the components on the web folder

```elixir
defp html_helpers do
  quote do
    use DaisyUIComponents
    # HTML escaping functionality
    import Phoenix.HTML
    # Core UI components from Live DaisyUI
    import DaisyUIComponents.CoreComponents

    # import YourProjectWeb.CoreComponents
    # Importing CoreComponents from your project is no longer necessary since
    # DaisyUIComponents.CoreComponents offers a drop in replacement
    # If you still want to use your own core components, remember to delete the default components generated from phoenix in this file
    # ...
  end
end
```

and that's it! You can use the components in your application

```elixir
def button_primary(assigns) do
  ~H"""
  <.button color="primary">
    Button with primary color
  </.button>
  """
end
```
