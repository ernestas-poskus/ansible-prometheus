# SNMP exporter variables

```yaml
# Snmp exporter
# https://github.com/prometheus/snmp_exporter

# Path to configuration file.
prometheus_snmp_exporter_config__file: "{{ prometheus_snmp_exporter_config_dir }}/snmp.yml"

# [EXPERIMENTAL] Path to configuration file that can enable TLS or authentication.
prometheus_snmp_exporter_web__config__file:

# Address to listen on for web interface and telemetry.
prometheus_snmp_exporter_web__listen_address: ':9116'

# Only log messages with the given severity or above. Valid levels: [debug, info, warn, error, fatal]
prometheus_snmp_exporter_log__level: 'info'

# Output format of log messages. One of: [logfmt, json]
prometheus_snmp_exporter_log__format: 'logfmt'

# SNMP exporter flags
prometheus_snmp_exporter____enabled_flags: []
#  - 'snmp.wrap-large-counters' # disabled by default
```
