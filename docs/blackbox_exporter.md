# Blackbox exporter variables

```yaml
# Blackbox exporter
# https://github.com/prometheus/blackbox_exporter

prometheus_black_box_config__file: "{{ prometheus_blackbox_exporter_config_dir }}/blackbox.yml"
# Blackbox exporter configuration file.

prometheus_black_box_history__limit: 100
# The maximum amount of items to keep in the history.

prometheus_black_box_web__listen_address: ':9115'
# The address to listen on for HTTP requests.

prometheus_black_box_timeout_offset: '0.5'
# Offset to subtract from timeout in seconds.

prometheus_black_box_log__level: 'info'
# Only log messages with the given severity or above. One of: [debug, info, warn, error]

prometheus_black_box_config_modules:
# Blackbox modules config in format of YAML
```
