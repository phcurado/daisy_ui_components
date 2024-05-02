defmodule DaisyUIComponentsSiteWeb.Storybook do
  use PhoenixStorybook,
    otp_app: :daisy_ui_components_site_web,
    content_path: Path.expand("../../storybook", __DIR__),
    # assets path are remote path, not local file-system paths
    css_path: "/assets/storybook.css",
    js_path: "/assets/storybook.js",
    sandbox_class: "daisy-ui-components-site-web"
end
