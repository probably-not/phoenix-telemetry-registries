defmodule PhoenixTelemetryRegistry.Phoenix do
  use TelemetryRegistry

  telemetry_event(%{
    event: [:phoenix, :endpoint, :init],
    description: """
    dispatched by `Phoenix.Endpoint` after your Endpoint supervision tree successfully starts.
    * Disable logging: This event is not logged.`
    """,
    measurements: "%{system_time: system_time}",
    metadata: "%{pid: pid(), config: Keyword.t(), module: module(), otp_app: atom()}"
  })

  telemetry_event(%{
    event: [:phoenix, :endpoint, :start],
    description: """
    dispatched by `Plug.Telemetry` in your endpoint, usually after code reloading.
    * Disable logging: In your endpoint `plug Plug.Telemetry, ..., log: Logger.level | false`
    * Configure log level dynamically: `plug Plug.Telemetry, ..., log: {Mod, Fun, Args}`
    * Options: `%{log: Logger.level | false}`
    """,
    measurements: "%{system_time: system_time}",
    metadata: "%{conn: Plug.Conn.t, options: Keyword.t}"
  })

  telemetry_event(%{
    event: [:phoenix, :endpoint, :stop],
    description: """
    dispatched by `Plug.Telemetry` in your endpoint whenever the response is sent.
    * Options: `%{log: Logger.level | false}`
    * Disable logging: In your endpoint `plug Plug.Telemetry, ..., log: Logger.level | false`
    * Configure log level dynamically: `plug Plug.Telemetry, ..., log: {Mod, Fun, Args}`
    """,
    measurements: "%{duration: native_time}",
    metadata: "%{conn: Plug.Conn.t, options: Keyword.t}"
  })

  telemetry_event(%{
    event: [:phoenix, :router_dispatch, :start],
    description: """
    dispatched by `Phoenix.Router` before dispatching to a matched route.
    * Disable logging: Pass `log: false` to the router macro, for example: `get("/page", PageController, :index, log: false)`
    * Configure log level dynamically: `get("/page", PageController, :index, log: {Mod, Fun, Args})`
    """,
    measurements: "%{system_time: System.system_time}",
    metadata:
      "%{conn: Plug.Conn.t, route: binary, plug: module, plug_opts: term, path_params: map, pipe_through: [atom], log: Logger.level | false}"
  })

  telemetry_event(%{
    event: [:phoenix, :router_dispatch, :exception],
    description: """
    dispatched by `Phoenix.Router` after exceptions on dispatching a route.
    * Disable logging: This event is not logged
    """,
    measurements: "%{duration: native_time}",
    metadata:
      "%{conn: Plug.Conn.t, kind: :throw | :error | :exit, reason: term(), stacktrace: Exception.stacktrace()}"
  })

  telemetry_event(%{
    event: [:phoenix, :router_dispatch, :stop],
    description: """
    dispatched by `Phoenix.Router` after successfully dispatching a matched route.
    * Disable logging: This event is not logged
    """,
    measurements: "%{duration: native_time}",
    metadata:
      "%{conn: Plug.Conn.t, route: binary, plug: module, plug_opts: term, path_params: map, pipe_through: [atom], log: Logger.level | false}"
  })

  telemetry_event(%{
    event: [:phoenix, :error_rendered],
    description: """
    dispatched at the end of an error view being rendered.
    * Disable logging: Set `render_errors: [log: false]` on your endpoint configuration
    """,
    measurements: "%{duration: native_time}",
    metadata:
      "%{conn: Plug.Conn.t, status: Plug.Conn.status, kind: Exception.kind, reason: term, stacktrace: Exception.stacktrace}"
  })

  telemetry_event(%{
    event: [:phoenix, :socket_connected],
    description: """
    dispatched by `Phoenix.Socket`, at the end of a socket connection.
    * Disable logging: `use Phoenix.Socket, log: false` or `socket "/foo", MySocket, websocket: [log: false]` in your endpoint
    """,
    measurements: "%{duration: native_time}",
    metadata:
      "%{endpoint: atom, transport: atom, params: term, connect_info: map, vsn: binary, user_socket: atom, result: :ok | :error, serializer: atom, log: Logger.level | false}"
  })

  telemetry_event(%{
    event: [:phoenix, :channel_joined],
    description: """
    dispatched at the end of a channel join.
    * Disable logging: This event cannot be disabled
    """,
    measurements: "%{duration: native_time}",
    metadata: "%{result: :ok | :error, params: term, socket: Phoenix.Socket.t}"
  })

  telemetry_event(%{
    event: [:phoenix, :channel_handled_in],
    description: """
    dispatched at the end of a channel handle in.
    * Disable logging: This event cannot be disabled
    """,
    measurements: "%{duration: native_time}",
    metadata: "%{event: binary, params: term, socket: Phoenix.Socket.t}"
  })

  @moduledoc """
  PhoenixTelemetryRegistry.Phoenix contains the list of all telemetry that is sent via telemetry in Phoenix.

  This is tracked in the Phoenix.Logger module.

  ## Telemetry

  #{telemetry_docs()}
  """
end
