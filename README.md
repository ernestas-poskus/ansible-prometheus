ansible-prometheus
=========

[![Build Status](https://travis-ci.org/ernestas-poskus/ansible-prometheus.svg?branch=master)](https://travis-ci.org/ernestas-poskus/ansible-prometheus)

Ansilbe playbook for installing Prometheus monitoring system.

Playbook installs and manages services using systemd. Currently supported:
  - Prometheus
  - Node Exporter (collects metrics of host machine)
  - Alert manager
  - Push gateway
  - SNMP exporter
  - Blackbox exporter

Playbook includes extensive configuration options check default/main.yml

Contribution
------------

If you can't find exporter you need check these examples
![#47](https://github.com/ernestas-poskus/ansible-prometheus/pull/47) or ![#50](https://github.com/ernestas-poskus/ansible-prometheus/pull/50)
and make pull request.

Installation
------------

ansible-galaxy install ernestas-poskus.ansible-prometheus

Requirements
------------

Systemd

Role Variables
--------------

```yaml
---
# defaults file for ansible-prometheus

prometheus_install: true
prometheus_node_exporter_install: true
prometheus_alert_manager_install: true
prometheus_push_gateway_install: false
prometheus_snmp_exporter_install: false
prometheus_blackbox_exporter_install: false

prometheus_owner: 'prometheus'
prometheus_group: 'prometheus'

prometheus_install_dir: '/usr/local/opt'
prometheus_config_dir: '/etc/prometheus'
prometheus_lib_dir: '/var/lib/prometheus'
prometheus_rules_dir: "{{ prometheus_config_dir }}/rules"

prometheus_data_dir: "{{ prometheus_lib_dir }}/prometheus2"
prometheus_alert_manager_data_dir: "{{ prometheus_lib_dir }}/alertmanager"
prometheus_alert_manager_config_dir: "{{ prometheus_config_dir }}/alertmanager"
prometheus_alert_manager_templates_dir: "{{ prometheus_config_dir }}/alertmanager/templates"
prometheus_snmp_exporter_config_dir: "{{ prometheus_config_dir }}/snmpexporter"
prometheus_blackbox_exporter_config_dir: "{{ prometheus_config_dir }}/blackboxexporter"

# Prometheus
prometheus_version: '2.0.0'
prometheus_platform_architecture: 'linux-amd64'

# Node exporter
prometheus_node_exporter_version: '0.15.2'

# Alert manager
prometheus_alert_manager_version: '0.13.0'

# Pushgateway
prometheus_push_gateway_version: '0.4.0'

# SNMP exporter
prometheus_snmp_exporter_version: '0.8.0'

# Blackbox exporter
prometheus_blackbox_exporter_version: '0.11.0'
```

![DOCS: Prometheus variables](/docs/prometheus.md)

![DOCS: Node exporter variables](/docs/node_exporter.md)

![DOCS: Alert manager variables](/docs/alert_manager.md)

![DOCS: Pushgateway variables](/docs/push_gateway.md)

![DOCS: SNMP exporter variables](/docs/snmp_exporter.md)

![DOCS: Blackbox exporter variables](/docs/blackbox_exporter.md)

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
