defmodule PhoenixTelemetryRegistry.LiveView do
  use TelemetryRegistry

  telemetry_event(%{
    event: [:phoenix, :live_view, :mount, :start],
    description: """
    Dispatched by a `Phoenix.LiveView` immediately before [`mount/3`](`c:Phoenix.LiveView.mount/3`) is invoked.
    """,
    measurements: "%{system_time: System.monotonic_time}",
    metadata:
      "%{socket: Phoenix.LiveView.Socket.t, params: unsigned_params | :not_mounted_at_router, session: map, uri: String.t() | nil}"
  })

  telemetry_event(%{
    event: [:phoenix, :live_view, :mount, :stop],
    description: """
    Dispatched by a `Phoenix.LiveView` when the [`mount/3`](`c:Phoenix.LiveView.mount/3`) callback completes successfully.
    """,
    measurements: "%{duration: native_time}",
    metadata:
      "%{socket: Phoenix.LiveView.Socket.t, params: unsigned_params | :not_mounted_at_router, session: map, uri: String.t() | nil}"
  })

  telemetry_event(%{
    event: [:phoenix, :live_view, :mount, :exception],
    description: """
    Dispatched by a `Phoenix.LiveView` when an exception is raised in the [`mount/3`](`c:Phoenix.LiveView.mount/3`) callback.
    """,
    measurements: "%{duration: native_time}",
    metadata:
      "%{socket: Phoenix.LiveView.Socket.t, kind: atom, reason: term, params: unsigned_params | :not_mounted_at_router, session: map, uri: String.t() | nil}"
  })

  telemetry_event(%{
    event: [:phoenix, :live_view, :handle_params, :start],
    description: """
    Dispatched by a `Phoenix.LiveView` immediately before [`handle_params/3`](`c:Phoenix.LiveView.handle_params/3`) is invoked.
    """,
    measurements: "%{system_time: System.monotonic_time}",
    metadata: "%{socket: Phoenix.LiveView.Socket.t, params: unsigned_params, uri: String.t()}"
  })

  telemetry_event(%{
    event: [:phoenix, :live_view, :handle_params, :stop],
    description: """
    Dispatched by a `Phoenix.LiveView` when the [`handle_params/3`](`c:Phoenix.LiveView.handle_params/3`) callback completes successfully.
    """,
    measurements: "%{duration: native_time}",
    metadata: "%{socket: Phoenix.LiveView.Socket.t, params: unsigned_params, uri: String.t()}"
  })

  telemetry_event(%{
    event: [:phoenix, :live_view, :handle_params, :exception],
    description: """
    Dispatched by a `Phoenix.LiveView` when an exception is raised in the [`handle_params/3`](`c:Phoenix.LiveView.handle_params/3`) callback.
    """,
    measurements: "%{duration: native_time}",
    metadata:
      "%{socket: Phoenix.LiveView.Socket.t, kind: atom, reason: term, params: unsigned_params, uri: String.t()}"
  })

  telemetry_event(%{
    event: [:phoenix, :live_view, :handle_event, :start],
    description: """
    Dispatched by a `Phoenix.LiveView` immediately before [`handle_event/3`](`c:Phoenix.LiveView.handle_event/3`) is invoked.
    """,
    measurements: "%{system_time: System.monotonic_time}",
    metadata: "%{socket: Phoenix.LiveView.Socket.t, params: unsigned_params, uri: String.t()}"
  })

  telemetry_event(%{
    event: [:phoenix, :live_view, :handle_event, :stop],
    description: """
    Dispatched by a `Phoenix.LiveView` when the [`handle_event/3`](`c:Phoenix.LiveView.handle_event/3`) callback completes successfully.
    """,
    measurements: "%{duration: native_time}",
    metadata: "%{socket: Phoenix.LiveView.Socket.t, params: unsigned_params, uri: String.t()}"
  })

  telemetry_event(%{
    event: [:phoenix, :live_view, :handle_event, :exception],
    description: """
    Dispatched by a `Phoenix.LiveView` when an exception is raised in the [`handle_event/3`](`c:Phoenix.LiveView.handle_event/3`) callback.
    """,
    measurements: "%{duration: native_time}",
    metadata:
      "%{socket: Phoenix.LiveView.Socket.t, kind: atom, reason: term, params: unsigned_params, uri: String.t()}"
  })

  telemetry_event(%{
    event: [:phoenix, :live_view, :render, :start],
    description: """
    Dispatched by a `Phoenix.LiveView` immediately before [`render/1`](`c:Phoenix.LiveComponent.render/1`) is invoked.
    """,
    measurements: "%{system_time: System.monotonic_time}",
    metadata: "%{socket: Phoenix.LiveView.Socket.t, force?: boolean, changed?: boolean}"
  })

  telemetry_event(%{
    event: [:phoenix, :live_view, :render, :stop],
    description: """
    Dispatched by a `Phoenix.LiveView` when the [`render/1`](`c:Phoenix.LiveView.render/1`) callback completes successfully.
    """,
    measurements: "%{duration: native_time}",
    metadata: "%{socket: Phoenix.LiveView.Socket.t, force?: boolean, changed?: boolean}"
  })

  telemetry_event(%{
    event: [:phoenix, :live_view, :render, :exception],
    description: """
    Dispatched by a `Phoenix.LiveView` when an exception is raised in the [`render/1`](`c:Phoenix.LiveView.render/1`) callback.
    """,
    measurements: "%{duration: native_time}",
    metadata:
      "%{socket: Phoenix.LiveView.Socket.t, kind: atom, reason: term, force?: boolean, changed?: boolean}"
  })

  telemetry_event(%{
    event: [:phoenix, :live_component, :update, :start],
    description: """
    Dispatched by a `Phoenix.LiveComponent` immediately before [`update/2`](`c:Phoenix.LiveComponent.update/2`) or a [`update_many/1`](`c:Phoenix.LiveComponent.update_many/1`) is invoked.

    In the case of[`update/2`](`c:Phoenix.LiveComponent.update/2`) it might dispatch one event for multiple calls.
    """,
    measurements: "%{system_time: System.monotonic_time}",
    metadata:
      "%{socket: Phoenix.LiveView.Socket.t, component: atom, assigns_sockets: [{map(), Phoenix.LiveView.Socket.t}]}"
  })

  telemetry_event(%{
    event: [:phoenix, :live_component, :update, :stop],
    description: """
    Dispatched by a `Phoenix.LiveComponent` when the [`update/2`](`c:Phoenix.LiveComponent.update/2`) or a [`update_many/1`](`c:Phoenix.LiveComponent.update_many/1`) callback completes successfully.

    In the case of[`update/2`](`c:Phoenix.LiveComponent.update/2`) it might dispatch one event for multiple calls.
    The `sockets` metadata contain the updated sockets.
    """,
    measurements: "%{duration: native_time}",
    metadata:
      "%{socket: Phoenix.LiveView.Socket.t, component: atom, assigns_sockets: [{map(), Phoenix.LiveView.Socket.t}], sockets: [Phoenix.LiveView.Socket.t]}"
  })

  telemetry_event(%{
    event: [:phoenix, :live_component, :update, :exception],
    description: """
    Dispatched by a `Phoenix.LiveComponent` when an exception is raised in the [`update/2`](`c:Phoenix.LiveComponent.update/2`) or a [`update_many/1`](`c:Phoenix.LiveComponent.update_many/1`) callback.

    In the case of[`update/2`](`c:Phoenix.LiveComponent.update/2`) it might dispatch one event for multiple calls.
    """,
    measurements: "%{duration: native_time}",
    metadata:
      "%{socket: Phoenix.LiveView.Socket.t, kind: atom, reason: term, component: atom, assigns_sockets: [{map(), Phoenix.LiveView.Socket.t}]}"
  })

  telemetry_event(%{
    event: [:phoenix, :live_component, :handle_event, :start],
    description: """
    Dispatched by a `Phoenix.LiveComponent` immediately before [`handle_event/3`](`c:Phoenix.LiveComponent.handle_event/3`) is invoked.
    """,
    measurements: "%{system_time: System.monotonic_time}",
    metadata:
      "%{socket: Phoenix.LiveView.Socket.t, component: atom, event: String.t(), params: unsigned_params}"
  })

  telemetry_event(%{
    event: [:phoenix, :live_component, :handle_event, :stop],
    description: """
    Dispatched by a `Phoenix.LiveComponent` when the [`handle_event/3`](`c:Phoenix.LiveComponent.handle_event/3`) callback completes successfully.
    """,
    measurements: "%{duration: native_time}",
    metadata:
      "%{socket: Phoenix.LiveView.Socket.t, component: atom, event: String.t(), params: unsigned_params}"
  })

  telemetry_event(%{
    event: [:phoenix, :live_component, :handle_event, :exception],
    description: """
    Dispatched by a `Phoenix.LiveComponent` when an exception is raised in the [`handle_event/3`](`c:Phoenix.LiveComponent.handle_event/3`) callback.
    """,
    measurements: "%{duration: native_time}",
    metadata:
      "%{socket: Phoenix.LiveView.Socket.t, kind: atom, reason: term, component: atom, event: String.t(), params: unsigned_params}"
  })

  @moduledoc """
  PhoenixTelemetryRegistry.LiveView contains the list of all telemetry that is sent via telemetry in Phoenix.LiveView.

  This is tracked in the Phoenix LiveView Telemetry Guide.

  ## Telemetry

  #{telemetry_docs()}
  """
end
