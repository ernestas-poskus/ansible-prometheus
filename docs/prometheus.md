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

# Allow Prometheus to write in remote storage
prometheus_config_remote_write:
  # - url: 'http://localhost:8086/api/v1/prom/write?db=prometheus'

# Allow Prometheus to read from remote storage
prometheus_config_remote_read:
  # - url: 'http://localhost:8086/api/v1/prom/read?db=prometheus'

prometheus_config__file: "{{ prometheus_config_dir }}/prometheus.yml"
# Prometheus configuration file name.

prometheus_log__format: "logfmt"
# Output format of log messages. One of: [logfmt, json]

prometheus_web__listen_address: ":9090"
# Address to listen on for the web interface, API, and telemetry.

prometheus_web__read_timeout: '30s'
# Maximum duration before timing out read of the request, and closing

prometheus_web__max_connections: 512
# Maximum number of simultaneous connections.

prometheus_web__page_title:
# Document title of Prometheus instance.

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

prometheus_web__cors__origin: ".*"
# Regex for CORS origin. It is fully anchored. Eg. 'https?://(domain1|domain2)\.com'

prometheus_web__console__libraries: 'console_libraries'
# Path to the console library directory.

prometheus_storage__tsdb__path: "{{ prometheus_data_dir }}"
# Base path for metrics storage.

prometheus_storage__tsdb__retention: '15d'
# How long to retain samples in the storage.

prometheus_storage__tsdb__retention__size:
# [EXPERIMENTAL] Maximum number of bytes that can
# be stored for blocks. Units supported: KB, MB,
# GB, TB, PB. This flag is experimental and can
# be changed in future releases.

prometheus_storage__tsdb__retention__time: "{{ prometheus_storage__tsdb__retention }}"
# How long to retain samples in the storage.

prometheus_alertmanager__notification_queue_capacity: 10000
# The capacity of the queue for pending alert manager notifications.

prometheus_alertmanager__timeout: '10s'
# Alert manager HTTP API timeout.

prometheus_query__lookback_delta: '5m'
# The delta difference allowed for retrieving metrics during expression evaluations.

prometheus_query__timeout: '2m'
# Maximum time a query may take before being aborted.

prometheus_rules__alert__for_grace_period: '10m'
# Minimum duration between alert and restored
# 'for' state. This is maintained only for alerts
# with configured 'for' time greater than grace
# period.

prometheus_rules__alert__for_outage_tolerance: '1h'
# Max time to tolerate prometheus outage for
# restoring 'for' state of alert.

prometheus_rules__alert__resend_delay: '1m'
# Minimum amount of time to wait before resending
# an alert to Alertmanager.

prometheus_storage__remote__flush_deadline:
# How long to wait flushing sample on shutdown or
# config reload.

prometheus_storage__remote__read_concurrent_limit: 10
# Maximum number of concurrent remote read calls.
# 0 means no limit.

prometheus_storage__remote__read_sample_limit: '5e7'
# Maximum overall number of samples to return via
# the remote read interface, in a single query. 0 means no limit.

prometheus_query__max_concurrency: 20
# Maximum number of queries executed concurrently.

prometheus_query__max_samples: 50000000
# Maximum number of samples a single query can
# load into memory. Note that queries will fail
# if they would load more samples than this into
# memory, so this also limits the number of
# samples a query can return.

prometheus_log__level: 'info'
# Only log messages with the given severity or above. Valid levels:
# [debug, info, warn, error, fatal].

# Prometheus flags
prometheus____enabled_flags: []
#  - 'storage.tsdb.no-lockfile' # disabled by default
#  - 'web.enable-admin-api' # disabled by default
#  - 'web.enable-lifecycle' # disabled by default
#  - 'web.external-url.' # disabled by default
```
