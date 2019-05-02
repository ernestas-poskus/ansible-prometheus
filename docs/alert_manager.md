# Alert manager variables

```yaml
# Alertmanager
# https://github.com/prometheus/alertmanager

prometheus_alert_manager_config_global:
  # # The smarthost and SMTP sender used for mail notifications.
  # smtp_smarthost: 'localhost:25'
  # smtp_from: 'alertmanager@example.org'
  # smtp_auth_username: 'alertmanager'
  # smtp_auth_password: 'password'
  # # The auth token for Hipchat.
  # hipchat_auth_token: '1234556789'
  # # Alternative host for Hipchat.
  # hipchat_url: 'https://hipchat.foobar.org/'

# The directory from which notification templates are read.
prometheus_alert_manager_config_templates:
  - "{{ prometheus_alert_manager_templates_dir }}/*.tmpl"

# The root route on which each incoming alert enters.
prometheus_alert_manager_config_route:
  group_by: ['alertname', 'cluster']
  group_wait: 30s
  group_interval: 5m
  repeat_interval: 3h
  receiver: 'default-pager'

# Inhibition rules allow to mute a set of alerts given that another alert is
# firing.
# We use this to mute any warning-level notifications if the same alert is
# already critical.
prometheus_alert_manager_config_inhibit_rules:

# Prometheus alert manager receivers
# since Ansible uses double curly braces as well as Prometheus for
# variable interpolation in receivers use double square brackets,
# those will be replaced to curly braces.
prometheus_alert_manager_config_receivers:
  - name: 'default-pager'
    pagerduty_configs:
    - service_key: '<team-X-key>'

prometheus_alert_manager_alerts__gc_interval: '30m'
# Interval between alert GC.
prometheus_alert_manager_cluster__advertise_address:
# Explicit address to advertise in cluster.
prometheus_alert_manager_cluster__gossip_interval: '200ms'
# Interval between sending gossip messages. By
prometheus_alert_manager_cluster__listen_address: '0.0.0.0:9094'
# Listen address for cluster.
prometheus_alert_manager_cluster__peer:
# Initial peers (may be repeated).
prometheus_alert_manager_cluster__peer_timeout: '15s'
# Time to wait between peers to send notifications.
prometheus_alert_manager_cluster__probe_interval: '1s'
# Interval between random node probes. Setting this lower (more frequent)
# will cause the cluster to detect failed nodes more quickly at the expense
# of increased bandwidth usage.
prometheus_alert_manager_cluster__probe_timeout: '500ms'
# Timeout to wait for an ack from a probed node before assuming it is
# unhealthy. This should be set to 99-percentile of RTT (round-trip time)
# on your network.
prometheus_alert_manager_cluster__pushpull_interval: '1m'
# Interval for gossip state syncs. Setting this interval lower (more frequent)
# will increase convergence speeds across larger clusters at
# the expense of increased bandwidth usage.
prometheus_alert_manager_cluster__reconnect_interval: '10s'
# Interval between attempting to reconnect to lost peers.
prometheus_alert_manager_cluster__reconnect_timeout: '6h'
# Length of time to attempt to reconnect to a lost peer.
prometheus_alert_manager_cluster__settle_timeout: '1m'
# Maximum time to wait for cluster connections to
# settle before evaluating notifications.
prometheus_alert_manager_cluster__tcp_timeout: '10s'
# Timeout for establishing a stream connection with a remote node for a
# full state sync, and for stream read and write operations.
prometheus_alert_manager_config__file: "{{ prometheus_alert_manager_config_dir }}/alertmanager.yml"
# Alertmanager configuration file name. (default "alertmanager.yml")
prometheus_alert_manager_data__retention: '120h0m0s'
# How long to keep data for. (default 120h0m0s)
prometheus_alert_manager_log__format: 'logfmt'
# Output format of log messages. One of: [logfmt,json]
prometheus_alert_manager_log__level: 'info'
# Only log messages with the given severity or above. Valid levels: [debug, info, warn, error, fatal]. (default info)
prometheus_alert_manager_storage__path: "{{ prometheus_alert_manager_data_dir }}"
# Base path for data storage. (default "data/")
prometheus_alert_manager_web__external_url:
# The URL under which Alertmanager is externally reachable
# (for example, if Alertmanager is served via a reverse proxy).
# Used for generating relative and absolute links back to Alertmanager itself.
# If the URL has a path portion, it will be used to prefix all HTTP endpoints served by Alertmanager.
# If omitted, relevant URL components will be derived automatically.
prometheus_alert_manager_web__listen_address: ':9093'
# Address to listen on for the web:interface and API. (default ":9093")
prometheus_alert_manager_web__route_prefix:
# Prefix for the internal routes of web endpoints. Defaults to path of -web.external-url.
```
