# Node exporter variables

```yaml
# Node exporter
# https://github.com/prometheus/node_exporter

prometheus_collector__diskstats__ignored_devices: "^(ram|loop|fd|(h|s|v|xv)d[a-z]|nvme\\d+n\\d+p)\\d+$"
# Regexp of devices to ignore for diskstats.
prometheus_collector__filesystem__ignored_fs_types: '^(autofs|binfmt_misc|bpf|cgroup2?|configfs|debugfs|devpts|devtmpfs|fusectl|hugetlbfs|mqueue|nsfs|overlay|proc|procfs|pstore|rpc_pipefs|securityfs|selinuxfs|squashfs|sysfs|tracefs)$'
# Regexp of filesystem types to ignore for filesystem collector.
prometheus_collector__netclass__ignored_devices: "^$"
# Regexp of net devices to ignore for netclass collector.
prometheus_collector__filesystem__ignored_mount_points: '^/(dev|proc|sys|var/lib/docker/.+)($|/)'
# Regexp of mount points to ignore for filesystem
prometheus_collector__netdev__ignored_devices: "^$"
# Regexp of net devices to ignore for netdev
prometheus_collector__netstat__fields: "^(.*_(InErrors|InErrs)|Ip_Forwarding|Ip(6|Ext)_(InOctets|OutOctets)|Icmp6?_(InMsgs|OutMsgs)|TcpExt_(Listen.*|Syncookies.*)|Tcp_(ActiveOpens|PassiveOpens|RetransSegs|CurrEstab)|Udp6?_(InDatagrams|OutDatagrams|NoPorts))$"
# Regexp of fields to return for netstat collector.
prometheus_collector__ntp__protocol_version: 4
# NTP protocol version (default 4)
prometheus_collector__ntp__server: '127.0.0.1'
# NTP server to use for ntp.
prometheus_collector__ntp__ip_ttl: 1
# IP TTL to use while sending NTP query
prometheus_collector__ntp__max_distance:
# Max accumulated distance to the root
prometheus_collector__ntp__local_offset_tolerance:
# Offset between local clock and local ntpd time to tolerate
prometheus_collector__path__procfs:
# procfs mountpoint. (default "/proc")
prometheus_collector__runit__servicedir: '/etc/service'
# Path to runit service directory. (default "/etc/service")
prometheus_collector__supervisord__url:
# XML RPC endpoint (default "http://localhost:9001/RPC2")
prometheus_collector__path__sysfs:
# sysfs mountpoint. (default "/sys")
prometheus_collector__path__rootfs: '/'
# rootfs mountpoint.
prometheus_collector__systemd__unit_blacklist:
# Regexp of systemd units to blacklist. Units must both match whitelist and not match blacklist to be included.
prometheus_collector__systemd__unit_whitelist: '.+'
# Regexp of systemd units to whitelist. Units must both match whitelist and not match blacklist to be included. (default ".+")
prometheus_collector__textfile__directory:
# Directory to read text files with metrics from.
prometheus_collector__vmstat__fields: "^(oom_kill|pgpg|pswp|pg.*fault).*"
# Regexp of fields to return for vmstat collector.
prometheus_collector__log__format:
# If set use a syslog logger or JSON logging. Example: logger:syslog?appname=bob&local=7 or logger:stdout?json=true. Defaults to stderr.
prometheus_collector__log__level: 'info'
# Only log messages with the given severity or above. Valid levels: [debug, info, warn, error, fatal]. (default info)
prometheus_collector__web__listen_address: ':9100'
# Address on which to expose metrics and web interface. (default ":9100")
prometheus_collector__web__telemetry_path: '/metrics'
# Path under which to expose metrics. (default "/metrics")
prometheus_collector__qdisc__fixtures:
# Test fixtures to use for qdisc collector end-to-end testing
prometheus_collector__wifi__fixtures:
# Test fixtures to use for wifi collector metrics

# Prometheus node exporter flags
prometheus_collector_____enabled_collectors:
  - 'collector.arp'
  - 'collector.bcache'
  - 'collector.bonding'
  - 'collector.cpu'
  - 'collector.edac'
  - 'collector.entropy'
  - 'collector.filefd'
  - 'collector.hwmon'
  - 'collector.ipvs'
  - 'collector.loadavg'
  - 'collector.mdadm'
  - 'collector.meminfo'
  - 'collector.netdev'
  - 'collector.netstat'
  - 'collector.nfs'
  - 'collector.nfsd'
  - 'collector.stat'
  - 'collector.time'
  - 'collector.timex'
  - 'collector.uname'
  - 'collector.vmstat'
  - 'collector.xfs'
  - 'collector.zfs'
#  - 'collector.buddyinfo' # disabled by default
#  - 'collector.conntrack' # disabled by default
#  - 'collector.diskstats' # disabled by default
#  - 'collector.drbd' # disabled by default
#  - 'collector.filesystem' # disabled by default
#  - 'collector.infiniband' # disabled by default
#  - 'collector.interrupts' # disabled by default
#  - 'collector.ksmd' # disabled by default
#  - 'collector.logind' # disabled by default
#  - 'collector.meminfo_numa' # disabled by default
#  - 'collector.mountstats' # disabled by default
#  - 'collector.netclass' # disabled by default
#  - 'collector.ntp' # disabled by default
#  - 'collector.ntp.server-is-local' # disabled by default
#  - 'collector.processes' # disabled by default
#  - 'collector.qdisc' # disabled by default
#  - 'collector.runit' # disabled by default
#  - 'collector.sockstat' # disabled by default
#  - 'collector.supervisord' # disabled by default
#  - 'collector.systemd' # disabled by default
#  - 'collector.systemd.private' # disabled by default
#  - 'collector.tcpstat' # disabled by default
#  - 'collector.textfile' # disabled by default
#  - 'collector.wifi' # disabled by default
```
