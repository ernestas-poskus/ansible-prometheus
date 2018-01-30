# Prometheus variables

```yaml
# Prometheus
# https://prometheus.io/docs/operating/configuration/

prometheus_config_global_scrape_interval: '15s'
prometheus_config_global_evaluation_interval: '30s'
prometheus_config_global_scrape_timeout: '10s'
prometheus_config_global_external_labels:
prometheus_config_rule_files:
  - "{{ prometheus_rules_dir }}/*.rules.yml"

# Prometheus alert manager rules
# since Ansible uses double curly braces as well as Prometheus for
# variable interpolation in alerts use square brackets, those will be
# replaced to curly braces in task
prometheus_rules:
  - name: instancedown
    rules:
    - alert: InstanceDown
      expr: up == 0
      for: '10s'
      annotations:
        summary: 'Instance [[ $labels.instance ]] down'
        description: '[[ $labels.instance ]] of job [[ $labels.job ]] has been down for more than 10 seconds.'

# Allow Prometheus to disover alert managers
prometheus_config_scrape_configs:
  # - job_name: 'prometheus'
  #   honor_labels: true
  #   scrape_interval: '20s'
  #   scrape_timeout: '2s'
  #   metrics_path: '/metrics'
  #   scheme: 'http'
  #   static_configs:
  #     - targets:
  #         - 'localhost:9090'
  # - job_name: 'consul-services'
  #   consul_sd_configs:
  #     - server: "localhost:8500"

# Allow Prometheus to disover alert managers
prometheus_config_alerting:
  alertmanagers:
  - static_configs:
    - targets:
      - localhost:9093

prometheus_config__file: "{{ prometheus_config_dir }}/prometheus.yml"
# Prometheus configuration file name.

prometheus_web__listen_address: ":9090"
# Address to listen on for the web interface, API, and telemetry.

prometheus_web__read_timeout: '30s'
# Maximum duration before timing out read of the request, and closing

prometheus_web__max_connections: 512
# Maximum number of simultaneous connections.

prometheus_web__external_url:
# The URL under which Prometheus is externally reachable (for
# example, if Prometheus is served via a reverse proxy). Used for
# generating relative and absolute links back to Prometheus itself. If the
# URL has a path portion, it will be used to prefix all HTTP endpoints
# served by Prometheus. If omitted, relevant URL components will be derived
# automatically.

prometheus_web__route_prefix:
# Prefix for the internal routes of web endpoints. Defaults to path
# of .web.external.url.

prometheus_web__user_assets:
# Path to static asset directory, available at /user.

prometheus_web__console__templates: 'consoles'
# Path to the console template directory, available at /consoles.

prometheus_web__console__libraries: 'console_libraries'
# Path to the console library directory.

prometheus_storage__tsdb__path: "{{ prometheus_data_dir }}"
# Base path for metrics storage.

prometheus_storage__tsdb__retention: '15d'
# How long to retain samples in the storage.

prometheus_alertmanager__notification_queue_capacity: 10000
# The capacity of the queue for pending alert manager notifications.

prometheus_alertmanager__timeout: '10s'
# Alert manager HTTP API timeout.

prometheus_query__lookback_delta: '5m'
# The delta difference allowed for retrieving metrics during expression evaluations.

prometheus_query__timeout: '2m'
# Maximum time a query may take before being aborted.

prometheus_query__max_concurrency: 20
# Maximum number of queries executed concurrently.

prometheus_log__level: 'info'
# Only log messages with the given severity or above. Valid levels:
# [debug, info, warn, error, fatal].

# Prometheus flags
prometheus____enabled_flags: []
#  - 'storage.tsdb.no-lockfile' # disabled by default
#  - 'web.enable-admin-api' # disabled by default
#  - 'web.enable-lifecycle' # disabled by default
```
