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
prometheus_alert_manager_config__file: "{{ prometheus_alert_manager_config_dir }}/alertmanager.yml"
# Alertmanager configuration file name. (default "alertmanager.yml")
prometheus_alert_manager_data__retention: '120h0m0s'
# How long to keep data for. (default 120h0m0s)
prometheus_alert_manager_log__level: 'info'
# Only log messages with the given severity or above. Valid levels: [debug, info, warn, error, fatal]. (default info)
prometheus_alert_manager_cluster__listen_address: '0.0.0.0:9094'
# cluster listen address (default "0.0.0.0:9094")
prometheus_alert_manager_cluster__advertise_address:
# cluster advertise address flag is required if the instance doesn't have an IP address that is part of RFC 6980 with a default route. 
# must use x.x.x.x:port as hostnames not accepted
prometheus_alert_manager_cluster__peer:
# cluster peers (repeat this flag for each additional peer)
prometheus_alert_manager_cluster__peer_timeout:
# cluster peer timeout (default: 15s)
prometheus_alert_manager_cluster__gossip-interval:
# cluster message propagation speed (default "200ms")
prometheus_alert_manager_cluster__pushpull_interval:
# lower values will increase convergence speeds at expense of bandwidth (default "1m0s")
prometheus_alert_manager_cluster__settle_timeout:
# maximum time to wait for cluster connections to settle before evaluating notifications.
prometheus_alert_manager_cluster__tcp_timeout:
# value: timeout value for tcp connections, reads and writes (default "10s")
prometheus_alert_manager_cluster__probe_timeout:
# value: probe-timeout value: time to wait for ack before marking node unhealthy (default "500ms")
prometheus_alert_manager_cluster__probe_interval:
# value: probe-timeout value: interval between random node probes (default "1s")
prometheus_alert_manager_storage__path: "{{ prometheus_alert_manager_data_dir }}"
# Base path for data storage. (default "data/")
prometheus_alert_manager_web__external_url:
# The URL under which Alertmanager is externally reachable
# (for example, if Alertmanager is served via a reverse proxy).
# Used for generating relative and absolute links back to Alertmanager itself.
# If the URL has a path portion, it will be used to prefix all HTTP endpoints served by Alertmanager.
# If omitted, relevant URL components will be derived automatically.
prometheus_alert_manager_web__listen_address: ':9093'
# Address to listen on for the web:erface and API. (default ":9093")
prometheus_alert_manager_web__route_prefix:
# Prefix for the internal routes of web endpoints. Defaults to path of -web.external-url.
```
