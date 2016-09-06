ansible-prometheus
=========

[![Build Status](https://travis-ci.org/ernestas-poskus/ansible-prometheus.svg?branch=master)](https://travis-ci.org/ernestas-poskus/ansible-prometheus)

Ansilbe playbook for installing Prometheus monitoring system.

Playbook installs and manages services using systemd. Currently supported:
  - Prometheus
  - Node Exporter (collects metrics of host machine)

Playbook includes extensive configuration options in:
 - vars/prometheus.yml
 - vars/nodeexporter.yml

Installation
------------

ansible-galaxy install ernestas-poskus.ansible-prometheus

Requirements
------------

Systemd

Role Variables
--------------

```yaml
prometheus_install: true
prometheus_node_exporter_install: true

prometheus_owner: 'prometheus'
prometheus_group: 'prometheus'

prometheus_install_dir: '/usr/local/opt'
prometheus_config_dir: '/etc/prometheus'
prometheus_data_dir: '/var/lib/prometheus'

# Prometheus
prometheus_version: '1.1.0'
prometheus_platform_architecture: 'linux-amd64'

# Node exporter
prometheus_node_exporter_version: '0.12.0'

# vars/prometheus.yml
# Prometheus
# https://prometheus.io/docs/operating/configuration/

prometheus_config_global_scrape_interval: '15s'
prometheus_config_global_evaluation_interval: '30s'
prometheus_config_global_scrape_timeout: '10s'
prometheus_config_global_external_labels:
prometheus_config_global_external_rules:
prometheus_config_rule_files:

prometheus_config_scrape_configs:
  - job_name: 'prometheus'
    honor_labels: true
    scrape_interval: '20s'
    scrape_timeout: '2s'
    metrics_path: '/metrics'
    scheme: 'http'
    static_configs:
      - targets:
          - 'localhost:9090'
  - job_name: 'consul-services'
    consul_sd_configs:
      - server: "localhost:8500"

  # - job_name: service-marathon
  #   marathon_sd_configs:
  #   - servers:
  #     - 'http://localhost.com:8080'

# == ALERT MANAGER ==
alertmanager__notification_queue_capacity: 10000
# The capacity of the queue for pending alert manager notifications.
alertmanager__timeout: '10s'
# Alert manager HTTP API timeout.
alertmanager__url:
# Comma_separated list of Alertmanager URLs to send notifications to.

# == LOG ==
log__format:
# If set use a syslog logger or JSON logging. Example:
# logger:syslog?appname=bob&local=7 or logger:stdout?json=true. Defaults to stderr.
log__level: "info"
# Only log messages with the given severity or above. Valid levels:
# [debug, info, warn, error, fatal].

# == QUERY ==
query__max_concurrency: 20
# Maximum number of queries executed concurrently.
query__staleness_delta: '5m0s'
# Staleness delta allowance during expression evaluations.
query__timeout: '2m0s'
# Maximum time a query may take before being aborted.

# == STORAGE ==
storage__local__checkpoint_dirty_series_limit: 5000
# If approx. that many time series are in a state that would require
# a recovery operation after a crash, a checkpoint is triggered, even if
# the checkpoint interval hasn't passed yet. A recovery operation requires
# a disk seek. The default limit intends to keep the recovery time below
# 1min even on spinning disks. With SSD, recovery is much faster, so you
# might want to increase this value in that case to avoid overly frequent
# checkpoints.
storage__local__checkpoint_interval: '5m0s'
# The period at which the in_memory metrics and the chunks not yet
# persisted to series files are checkpointed.
storage__local__chunk_encoding_version: 1
# Which chunk encoding version to use for newly created chunks.
# Currently supported is 0 (delta encoding), 1 (double_delta encoding), and
# 2 (double_delta encoding with variable bit_width).
storage__local__dirty: false
# If set, the local storage layer will perform crash recovery even if
# the last shutdown appears to be clean.
storage__local__index_cache_size__fingerprint_to_metric: 10485760
# The size in bytes for the fingerprint to metric index cache.
storage__local__index_cache_size__fingerprint_to_timerange: 5242880
# The size in bytes for the metric time range index cache.
storage__local__index_cache_size__label_name_to_label_values: 10485760
# The size in bytes for the label name to label values index cache.
storage__local__index_cache_size__label_pair_to_fingerprints: 20971520
# The size in bytes for the label pair to fingerprints index cache.
storage__local__max_chunks_to_persist: 524288
# How many chunks can be waiting for persistence before sample
# ingestion will be throttled. Many chunks waiting to be persisted will
# increase the checkpoint size.
storage__local__memory_chunks: 1048576
# How many chunks to keep in memory. While the size of a chunk is
# 1kiB, the total memory usage will be significantly higher than this value
# * 1kiB. Furthermore, for various reasons, more chunks might have to be
# kept in memory temporarily. Sample ingestion will be throttled if the
# configured value is exceeded by more than 10%.
storage__local__num_fingerprint_mutexes: 4096
# The number of mutexes used for fingerprint locking.
storage__local__path: "{{ prometheus_data_dir }}"
# Base path for metrics storage.
storage__local__pedantic_checks: false
# If set, a crash recovery will perform checks on each series file.
# This might take a very long time.
storage__local__retention: '360h0m0s'
# How long to retain samples in the local storage.
storage__local__series_file_shrink_ratio: 0.1
# A series file is only truncated (to delete samples that have
# exceeded the retention period) if it shrinks by at least the provided
# ratio. This saves I/O operations while causing only a limited storage
# space overhead. If 0 or smaller, truncation will be performed even for a
# single dropped chunk, while 1 or larger will effectively prevent any
# truncation.
storage__local__series_sync_strategy: "adaptive"
# When to sync series files after modification. Possible values:
# 'never', 'always', 'adaptive'. Sync'ing slows down storage performance
# but reduces the risk of data loss in case of an OS crash. With the
# 'adaptive' strategy, series files are sync'd for as long as the storage
# is not too much behind on chunk persistence.
storage__remote__graphite_address:
# The host:port of the remote Graphite server to send samples to.
# None, if empty.
storage__remote__graphite_prefix:
# The prefix to prepend to all metrics exported to Graphite. None, if
# empty.
storage__remote__graphite_transport: "tcp"
# Transport protocol to use to communicate with Graphite. 'tcp', if
# empty.
storage__remote__influxdb_url:
# The URL of the remote InfluxDB server to send samples to. None, if
# empty.
storage__remote__influxdb__database: "prometheus"
# The name of the database to use for storing samples in InfluxDB.
storage__remote__influxdb__retention_policy: "default"
# The InfluxDB retention policy to use.
storage__remote__influxdb__username:
# The username to use when sending samples to InfluxDB. The
# corresponding password must be provided via the INFLUXDB_PW environment variable.
storage__remote__opentsdb_url:
# The URL of the remote OpenTSDB server to send samples to. None, if  empty.
storage__remote__timeout: '30s'
# The timeout to use when sending samples to the remote storage.

# == WEB ==
web__console__libraries: "console_libraries"
# Path to the console library directory.
web__console__templates: "consoles"
# Path to the console template directory, available at /consoles.
web__enable_remote_shutdown: false
# Enable remote service shutdown.
web__external_url:
# The URL under which Prometheus is externally reachable (for
# example, if Prometheus is served via a reverse proxy). Used for
# generating relative and absolute links back to Prometheus itself. If the
# URL has a path portion, it will be used to prefix all HTTP endpoints
# served by Prometheus. If omitted, relevant URL components will be derived
# automatically.
web__listen_address: ":9090"
# Address to listen on for the web interface, API, and telemetry.
web__route_prefix:
# Prefix for the internal routes of web endpoints. Defaults to path
# of .web.external.url.
web__telemetry_path: "/metrics"
# Path under which to expose metrics.
web__user_assets:
# Path to static asset directory, available at /user.

# vars/nodeexporter.yml
# Node exporter
# https://github.com/prometheus/node_exporter

collector__diskstats__ignored_devices:
# Regexp of devices to ignore for diskstats__ (default "^(ram|loop|fd|(h|s|v|xv)d[a_z])\d+$")
collector__filesystem__ignored_mount_points:
# Regexp of mount points to ignore for filesystem collector__ (default "^/(sys|proc|dev)($|/)")
collector__megacli__command:
# Command to run megacli__ (default "megacli")
collector__netdev__ignored_devices:
# Regexp of net devices to ignore for netdev collector__ (default "^$")
collector__ntp__protocol_version:
# NTP protocol version (default 4)
collector__ntp__server:
# NTP server to use for ntp collector__
collector__procfs:
# procfs mountpoint__ (default "/proc")
collector__supervisord__url:
# XML RPC endpoint (default "http://localhost:9001/RPC2")
collector__sysfs:
# sysfs mountpoint__ (default "/sys")
collector__systemd__private:
# Establish a private, direct connection to systemd without dbus__
collector__textfile__directory:
# Directory to read text files with metrics from__
collectors__enabled:
# Comma_separated list of collectors to use__ (default "conntrack,diskstats,entropy,filefd,filesystem,loadavg,mdadm,meminfo,netdev,netstat,sockstat,stat,textfile,time,uname,vmstat")
collectors__print:
# If true, print available collectors and exit__
log__format:
# If set use a syslog logger or JSON logging__ Example: logger:syslog?appname=bob&local=7 or logger:stdout?json=true__ Defaults to stderr__
log__level: 'info'
# Only log messages with the given severity or above__ Valid levels: [debug, info, warn, error, fatal]__ (default info)
web__listen_address: ':9100'
# Address on which to expose metrics and web interface__ (default ":9100")
web__telemetry_path: '/metrics'
# Path under which to expose metrics. (default "/metrics")
```

Dependencies
------------

None.

Example Playbook
----------------

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

```yaml
- name: Installing Prometheus on hosted machine
  hosts: vagrant1
  sudo: yes
  roles:
    - role: ansible-prometheus
      prometheus_config_scrape_configs:
        - job_name: 'prometheus'
          honor_labels: true
          scrape_interval: '15s'
          scrape_timeout: '3s'
          metrics_path: '/metrics'
          scheme: 'http'
          static_configs:
            - targets:
                - 'localhost:9090' # Prometheus itself
                - 'localhost:9100' # Node exporter
        - job_name: 'consul-services'
          consul_sd_configs:
            - server: "localhost:8500"
```

License
-------

Copyright (c) 2016, Ernestas Poskus
All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:

* Redistributions of source code must retain the above copyright notice, this
  list of conditions and the following disclaimer.

* Redistributions in binary form must reproduce the above copyright notice,
  this list of conditions and the following disclaimer in the documentation
  and/or other materials provided with the distribution.

* Neither the name of ansible-prometheus nor the names of its
  contributors may be used to endorse or promote products derived from
  this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

Author Information
------------------

Twitter: @ernestas_poskus
