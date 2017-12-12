# Push gateway variables

```yaml
# Pushgateway
# https://github.com/prometheus/pushgateway

prometheus_push_gateway_log__format:
# If set use a syslog logger or JSON logging. Example: logger:syslog?appname=bob&local=7 or logger:stdout?json=true. Defaults to stderr.
prometheus_push_gateway_log__level: 'info'
# Only log messages with the given severity or above. Valid levels: [debug, info, warn, error, fatal].
prometheus_push_gateway_persistence__file:
# File to persist metrics. If empty, metrics are only kept in memory.
prometheus_push_gateway_persistence__interval:
# The minimum interval at which to write out the persistence file. (default 5m0s)
prometheus_push_gateway_web__listen_address: ':9091'
# Address to listen on for the web interface, API, and telemetry. (default ":9091")
prometheus_push_gateway_web__telemetry_path: '/metrics'
# Path under which to expose metrics. (default "/metrics")
```
