# Blackbox exporter variables

```yaml
# Blackbox exporter
# https://github.com/prometheus/blackbox_exporter

prometheus_black_box_config__file: "{{ prometheus_blackbox_exporter_config_dir }}/blackbox.yml"
# Blackbox exporter configuration file.

prometheus_black_box_history__limit: 100
# The maximum amount of items to keep in the history.

prometheus_black_box_log__format: 'logfmt'
# Output format of log messages. One of: [logfmt, json]

prometheus_black_box_web__listen_address: ':9115'
# The address to listen on for HTTP requests.

prometheus_black_box_web__route_prefix:
# Prefix for the internal routes of web endpoints. Defaults to path of

prometheus_black_box_timeout_offset: '0.5'
# Offset to subtract from timeout in seconds.

prometheus_black_box_web__external_url:
# The URL under which Blackbox exporter is
# externally reachable (for example, if Blackbox
# exporter is served via a reverse proxy). Used
# for generating relative and absolute links back
# to Blackbox exporter itself. If the URL has a
# path portion, it will be used to prefix all
# HTTP endpoints served by Blackbox exporter. If
# omitted, relevant URL components will be
# derived automatically.

prometheus_black_box_log__level: 'info'
# Only log messages with the given severity or above. One of: [debug, info, warn, error]

prometheus_black_box_config_modules:
# Blackbox modules config in format of YAML
```
