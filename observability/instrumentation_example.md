# Instrumentation example

Add structured logging (JSON), basic metrics, and tracing hooks. Example pseudo-code:

- Log: {timestamp, level, service, request_id, msg, extra}
- Metric: counter("requests_total", labels={route, status})
- Trace: start_span("process_payment") ... end_span()

Use OpenTelemetry SDK for your runtime to export traces and metrics to a backend.
