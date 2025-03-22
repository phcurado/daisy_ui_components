## 📦 Installation

Reference this repository on your `mix.exs` file to start using.

```elixir
def deps do
  [
    {:daisy_ui_components, "~> 0.8"}
  ]
end
```

Add through `npm` the daisy UI package inside your phoenix application:

```bash
cd assets
npm i -D daisyui@5
```

On `tailwind.config.js` include Live DaisyUI Components under the content list and reference under plugins

```javascript
module.exports = {
  content: [
    //...
    "../deps/daisy_ui_components/**/*.*ex", // <- reference DaisyUIComponents as content path
  ],
  //...
  plugins: [
    //...
    // comment the tailwind form to not conflict with DaisyUI
    // require("@tailwindcss/forms"),
    require("daisyui"), // <- add daisyUI plugin
    //...
  ],
};
```

Add error translation function to your app's config.exs file. This function is used to translate ecto changeset errors

```elixir
config :daisy_ui_components, translate_function: &MyAppWeb.CoreComponents.translate_error/1
```

And now this library is ready. To have the components available under liveview, import the components on the web folder

```elixir
defp html_helpers do
  quote do
    # Translation
    use Gettext, backend: MyAppWeb.Gettext

    # HTML escaping functionality
    import Phoenix.HTML

    # Import DaisyUI components into your project
    use DaisyUIComponents

    # Comment your own CoreComponents to not conflict with the defaults of this library.
    # import YourProjectWeb.CoreComponents
    # Importing CoreComponents from your project is no longer necessary since
    # DaisyUIComponents.CoreComponents offers a drop in replacement
    # If you still want to use your own core components, remember to delete the default components generated from phoenix in this file
    # ...
  end
end
```

Finally, in order to not conflict with some of the DaisyUI default styles, remove the `bg-white` class in your `root.html.heex` file.

```heex
## Change from this
<body class="bg-white">
## to this
<body>
```

## ⭐ Core Components

This library aims to integrate seamlessly with Phoenix generators. For this reason you don't need the components inside the `CoreComponents` after adding `use DaisyUIComponents` into your web file.
All the components should be compatible, styled with DaisyUI.

If you encounter any compatibility issues, feel free to open an `issue` or submit a `pull request`, and I'll take a look.

## 🤖 Liveview 1.0

This project is fully compatible with the Liveview 1.0 🔥. If you are using a previous Liveview version, check the [migration guide](https://github.com/phoenixframework/phoenix_live_view/blob/v1.0/CHANGELOG.md).

## 📦 NPM setup

Since DaisyUI requires `npm` to install, it's also necessary to configure in your project the asset pipeline to use the npm commands.

In your `mix.exs` file, add the npm command in your assets setup:

```diff
"assets.setup": [
  "tailwind.install --if-missing",
- "esbuild.install --if-missing"
+ "esbuild.install --if-missing",
+ "cmd npm install --prefix assets"
]
```

and if you are deploying the application with `Docker`, run the npm scripts there too:

```diff
# install build dependencies
-RUN apt-get update -y && apt-get install -y build-essential git \
+RUN apt-get update -y && apt-get install -y build-essential git npm \
    && apt-get clean && rm -f /var/lib/apt/lists/*_*

# ...
RUN mix deps.compile

# build assets
+COPY assets/package.json assets/package-lock.json ./assets/
+RUN npm --prefix ./assets ci --progress=false --no-audit --loglevel=error
```
