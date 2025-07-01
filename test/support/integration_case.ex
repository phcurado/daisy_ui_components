defmodule DaisyUIComponents.IntegrationCase do
  use ExUnit.CaseTemplate

  defmodule Endpoint do
    use Phoenix.Endpoint, otp_app: :daisy_ui_components
  end

  using do
    quote do
      @endpoint DaisyUIComponents.IntegrationCase.Endpoint

      import Phoenix.ConnTest
      import Phoenix.LiveViewTest
    end
  end

  setup do
    Application.put_env(:daisy_ui_components, Endpoint,
      live_view: [signing_salt: "aaaaaaaa"],
      secret_key_base: String.duplicate("a", 64)
    )

    start_supervised!(Endpoint)

    %{conn: Phoenix.ConnTest.build_conn()}
  end
end
