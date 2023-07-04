# LiveDaisyuiComponents

DaisyUI + Liveview

This project is still experimental, expect breaking changes in future.

## Installation

Reference this repository on your `mix.exs` file to start using.

```elixir
def deps do
  [
    {:live_daisyui_components, github: "phcurado/live_daisyui_components"}
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
    "../deps/live_daisyui_components/**/*.*ex" // <- reference Live Daisy UI Components as content path
  ],
  //...
  plugins: [
    //...
    require("daisyui")  <- // add daisyUI plugin
    //...
  ]
}
```

And now this library is ready. To have the components available under liveview, import the components on the web folder

```elixir
defp html_helpers do
  quote do
    use LiveDaisyuiComponents
    # HTML escaping functionality
    import Phoenix.HTML
    # Core UI components from Live DaisyUI
    import LiveDaisyuiComponents.CoreComponents

    # import YourProjectWeb.CoreComponents
    # Importing CoreComponents from your project is no longer necessary since 
    # LiveDaisyuiComponents.CoreComponents offers a drop in replacement
    # If you still want to use your own core components, remember to delete the default components generated from phoenix in this file
    # ...
  end
end
```

Check the [Core Components](./lib/live_daisyui_components/core_components.ex) implementation for replacing the default phoenix core components. The components have the same logic from Phoenix default generator, but now using DaisyUI styles. Some function names were changed to avoid conflicts with the naming convention from DaisyUI components, for example `table/1` was renamed to `simple_table/1` so we can use our own [table](./lib/live_daisyui_components/table.ex) component without conflicts.

## Roadmap

1. Main DaisyUI components
  - ~~[Alert](https://daisyui.com/components/alert)~~
  - [Artboard](https://daisyui.com/components/artboard)
  - ~~[Avatar](https://daisyui.com/components/avatar)~~
  - ~~[Badge](https://daisyui.com/components/badge)~~
  - [Bottom navigation](https://daisyui.com/components/botton-navigation)
  - [Breadcrumbs](https://daisyui.com/components/breadcrumbs)
  - ~~[Button group](https://daisyui.com/components/button-group)~~
  - ~~[Button](https://daisyui.com/components/button)~~
  - ~~[Card](https://daisyui.com/components/card)~~
  - [Carousel](https://daisyui.com/components/carousel)
  - [Chat bubble](https://daisyui.com/components/chat)
  - ~~[Checkbox](https://daisyui.com/components/checkbox)~~
  - [Collapse](https://daisyui.com/components/collapse)
  - [Countdown](https://daisyui.com/components/countdown)
  - [Divider](https://daisyui.com/components/divider)
  - [Drawer](https://daisyui.com/components/drawer)
  - [Dropdown](https://daisyui.com/components/dropdown)
  - [File input](https://daisyui.com/components/file-input)
  - [Footer](https://daisyui.com/components/footer)
  - ~~[Join](https://daisyui.com/components/join)~~
  - [Hero](https://daisyui.com/components/hero)
  - [Indicator](https://daisyui.com/components/indicator)
  - [Input group](https://daisyui.com/components/input-group)
  - ~~[Text Input](https://daisyui.com/components/input)~~
  - [Kbd](https://daisyui.com/components/kbd)
  - [Link](https://daisyui.com/components/link)
  - [Mask](https://daisyui.com/components/mask)
  - [Menu](https://daisyui.com/components/menu)
  - [Code mockup](https://daisyui.com/components/mockup-code)
  - [Phone mockup](https://daisyui.com/components/mockup-phone)
  - [Window mockup](https://daisyui.com/components/mockup-window)
  - ~~[Modal](https://daisyui.com/components/modal)~~
  - [Navbar](https://daisyui.com/components/navbar)
  - ~~[[Pagination](https://daisyui.com/components/pagination)~~[
  - [Progress](https://daisyui.com/components/progress)
  - [Radial progress](https://daisyui.com/components/radial-progress)
  - [Radio](https://daisyui.com/components/radio)
  - [Range slider](https://daisyui.com/components/range)
  - [Rating](https://daisyui.com/components/rating)
  - ~~[Select](https://daisyui.com/components/select)~~
  - [Stack](https://daisyui.com/components/stack)
  - [Stat](https://daisyui.com/components/stat)
  - [Steps](https://daisyui.com/components/steps)
  - [Swap](https://daisyui.com/components/swap)
  - [Tabs](https://daisyui.com/components/tab)
  - ~~[Table](https://daisyui.com/components/table)~~
  - ~~[Textarea](https://daisyui.com/components/textarea)~~
  - [Toast](https://daisyui.com/components/toast)
  - [Toggle](https://daisyui.com/components/toggle)
  - ~~[Tooltip](https://daisyui.com/components/tooltip)~~

2. Extras
  - Phoenix Core components replacement
  - mix script for replacing phoenix core_components
