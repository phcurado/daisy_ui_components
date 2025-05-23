# 🌻 DaisyUI Components

[![CI](https://github.com/phcurado/daisy_ui_components/actions/workflows/ci.yml/badge.svg)](https://github.com/phcurado/daisy_ui_components/actions/workflows/ci.yml)
[![Coverage Status](https://coveralls.io/repos/github/phcurado/daisy_ui_components/badge.svg?branch=main)](https://coveralls.io/github/phcurado/daisy_ui_components?branch=main)
[![Hex.pm](https://img.shields.io/hexpm/v/daisy_ui_components)](https://hex.pm/packages/daisy_ui_components)
[![HexDocs.pm](https://img.shields.io/badge/Docs-HexDocs-blue)](https://hexdocs.pm/daisy_ui_components)
[![License](https://img.shields.io/hexpm/l/daisy_ui_components.svg)](https://hex.pm/packages/daisy_ui_components)

📚 [Storybook](https://daisy-ui-components-site.fly.dev/storybook/welcome)

---

<a href='https://ko-fi.com/R5R11AIF9P' target='_blank'><img height='36' style='border:0px;height:36px;' src='https://storage.ko-fi.com/cdn/kofi6.png?v=6' border='0' alt='Buy Me a Coffee at ko-fi.com' /></a>

This project brings [DaisyUI](https://daisyui.com/) components into your [Phoenix](https://www.phoenixframework.org) project.

![Phoenix DaisyUI Image](demo.png)

## 📦 Installation

<!-- MDOC -->

### Installing it with mix archive installer

```bash
mix archive.install hex daisy_ui_installer
```

In the Phoenix project folder

```bash
mix daisy
```

Alternative, you can just install a single component

```bash
mix daisy badge input
```

**_NOTE:_** This will install as well component dependencies which can be another components.

### Installing as a dependency

Reference this repository on your `mix.exs` file to start using.

```elixir
def deps do
  [
    {:daisy_ui_components, "~> 0.8"}
  ]
end
```

### DaisyUI Assets

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

## ⚡️ Components

List of available components.

### Actions

| Component                                                            | Status | Storybook |
| -------------------------------------------------------------------- | ------ | --------- |
| [Button](https://daisyui.com/components/button)                      | ✅     | ✅        |
| [Dropdown](https://daisyui.com/components/dropdown)                  | ✅     | ✅        |
| [Modal](https://daisyui.com/components/modal)                        | ✅     | ✅        |
| [Swap](https://daisyui.com/components/swap)                          | ✅     | ✅        |
| [Theme Controller](https://daisyui.com/components/theme-controller/) | ❌     | ❌        |

### Data Display

| Component                                             | Status | Storybook |
| ----------------------------------------------------- | ------ | --------- |
| [Accordion](https://daisyui.com/components/accordion) | ✅     | ❌        |
| [Avatar](https://daisyui.com/components/avatar)       | ✅     | ✅        |
| [Badge](https://daisyui.com/components/badge)         | ✅     | ✅        |
| [Card](https://daisyui.com/components/card)           | ✅     | ✅        |
| [Carousel](https://daisyui.com/components/carousel)   | ❌     | ❌        |
| [Chat bubble](https://daisyui.com/components/chat)    | ❌     | ❌        |
| [Collapse](https://daisyui.com/components/collapse)   | ❌     | ❌        |
| [Countdown](https://daisyui.com/components/countdown) | ❌     | ❌        |
| [Diff](https://daisyui.com/components/diff/)          | ❌     | ❌        |
| [Kbd](https://daisyui.com/components/kbd)             | ❌     | ❌        |
| [Stat](https://daisyui.com/components/stat)           | ✅     | ✅        |
| [Table](https://daisyui.com/components/table)         | ✅     | ✅        |
| [Timeline](https://daisyui.com/components/timeline/)  | ❌     | ❌        |

### Navigation

| Component                                                 | Status | Storybook |
| --------------------------------------------------------- | ------ | --------- |
| [Breadcrumbs](https://daisyui.com/components/breadcrumbs) | ✅     | ✅        |
| [Dock](https://daisyui.com/components/dock/)              | ❌     | ❌        |
| [Link](https://daisyui.com/components/link)               | ❌     | ❌        |
| [Menu](https://daisyui.com/components/menu)               | ✅     | ✅        |
| [Navbar](https://daisyui.com/components/navbar)           | ✅     | ✅        |
| [Pagination](https://daisyui.com/components/pagination)   | ✅     | ✅        |
| [Steps](https://daisyui.com/components/steps)             | ❌     | ❌        |
| [Tabs](https://daisyui.com/components/tab)                | ✅     | ❌        |

### Feedback

| Component                                                         | Status | Storybook |
| ----------------------------------------------------------------- | ------ | --------- |
| [Alert](https://daisyui.com/components/alert)                     | ✅     | ✅        |
| [Loading](https://daisyui.com/components/loading/)                | ✅     | ✅        |
| [Progress](https://daisyui.com/components/progress)               | ✅     | ✅        |
| [Radial progress](https://daisyui.com/components/radial-progress) | ❌     | ❌        |
| [Skeleton](https://daisyui.com/components/skeleton/)              | ❌     | ❌        |
| [Toast](https://daisyui.com/components/toast)                     | ❌     | ❌        |
| [Tooltip](https://daisyui.com/components/tooltip)                 | ✅     | ✅        |

### Data Input

| Component                                               | Status | Storybook |
| ------------------------------------------------------- | ------ | --------- |
| [Checkbox](https://daisyui.com/components/checkbox)     | ✅     | ✅        |
| [Fieldset](https://daisyui.com/components/fieldset)     | ✅     | ✅        |
| [File input](https://daisyui.com/components/file-input) | ❌     | ❌        |
| [Label](https://daisyui.com/components/label)           | ✅     | ✅        |
| [Radio](https://daisyui.com/components/radio)           | ✅     | ✅        |
| [Range](https://daisyui.com/components/range)           | ✅     | ✅        |
| [Rating](https://daisyui.com/components/rating)         | ❌     | ❌        |
| [Select](https://daisyui.com/components/select)         | ✅     | ✅        |
| [Text Input](https://daisyui.com/components/input)      | ✅     | ✅        |
| [Textarea](https://daisyui.com/components/textarea)     | ✅     | ✅        |
| [Toggle](https://daisyui.com/components/toggle)         | ✅     | ✅        |
| [Validator](https://daisyui.com/components/validator)   | ✅     | ✅        |

### Layout

| Component                                             | Status | Storybook |
| ----------------------------------------------------- | ------ | --------- |
| [Artboard](https://daisyui.com/components/artboard)   | ❌     | ❌        |
| [Divider](https://daisyui.com/components/divider)     | ❌     | ❌        |
| [Drawer](https://daisyui.com/components/drawer)       | ✅     | ✅        |
| [Footer](https://daisyui.com/components/footer)       | ✅     | ✅        |
| [Hero](https://daisyui.com/components/hero)           | ✅     | ✅        |
| [Indicator](https://daisyui.com/components/indicator) | ✅     | ✅        |
| [Join](https://daisyui.com/components/join)           | ✅     | ✅        |
| [Mask](https://daisyui.com/components/mask)           | ❌     | ❌        |
| [Stack](https://daisyui.com/components/stack)         | ❌     | ❌        |

### Mockup

| Component                                                 | Status | Storybook |
| --------------------------------------------------------- | ------ | --------- |
| [Browser](https://daisyui.com/components/mockup-browser/) | ❌     | ❌        |
| [Code](https://daisyui.com/components/mockup-code)        | ❌     | ❌        |
| [Phone](https://daisyui.com/components/mockup-phone)      | ❌     | ❌        |
| [Window](https://daisyui.com/components/mockup-window)    | ❌     | ❌        |

### Phoenix Core Components

| Component   | Status | Storybook |
| ----------- | ------ | --------- |
| Flash       | ✅     | ✅        |
| Header      | ✅     | ✅        |
| List        | ✅     | ✅        |
| Simple Form | ✅     | ✅        |
| Input       | ✅     | ✅        |
| Table       | ✅     | ✅        |

## 🗺️ Roadmap

- [x] Update components for the new [DaisyUI 5](https://daisyui.com/docs/upgrade/)
- [ ] Implement all components from DaisyUI with storybook
- [ ] Update documentation with the new Phoenix release
- [x] Create `mix` script to enable users to import the components of this library into their projects, sharing the same project namespace
