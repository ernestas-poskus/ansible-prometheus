input = <<eos
--collector.diskstats.ignored-devices="^(ram|loop|fd|(h|s|v|xv)d[a-z]|nvme\\d+n\\d+p)\\d+$"
Regexp of devices to ignore for diskstats.
--collector.filesystem.ignored-mount-points="^/(dev|proc|sys|var/lib/docker/.+)($|/)"
Regexp of mount points to ignore for filesystem
collector.
--collector.filesystem.ignored-fs-types="^(autofs|binfmt_misc|bpf|cgroup2?|configfs|debugfs|devpts|devtmpfs|fusectl|hugetlbfs|mqueue|nsfs|overlay|proc|procfs|pstore|rpc_pipefs|securityfs|selinuxfs|squashfs|sysfs|tracefs)$"
Regexp of filesystem types to ignore for
filesystem collector.
--collector.netclass.ignored-devices="^$"
Regexp of net devices to ignore for netclass
collector.
--collector.netdev.ignored-devices="^$"
Regexp of net devices to ignore for netdev
collector.
--collector.netstat.fields="^(.*_(InErrors|InErrs)|Ip_Forwarding|Ip(6|Ext)_(InOctets|OutOctets)|Icmp6?_(InMsgs|OutMsgs)|TcpExt_(Listen.*|Syncookies.*|TCPSynRetrans)|Tcp_(ActiveOpens|InSegs|OutSegs|PassiveOpens|RetransSegs|CurrEstab)|Udp6?_(InDatagrams|OutDatagrams|NoPorts))$"
Regexp of fields to return for netstat
collector.
--collector.ntp.server="127.0.0.1"
NTP server to use for ntp collector
--collector.ntp.protocol-version=4
NTP protocol version
--collector.ntp.server-is-local
Certify that collector.ntp.server address is the
same local host as this collector.
--collector.ntp.ip-ttl=1  IP TTL to use while sending NTP query
--collector.ntp.max-distance=3.46608s
Max accumulated distance to the root
--collector.ntp.local-offset-tolerance=1ms
Offset between local clock and local ntpd time
to tolerate
--path.procfs="/proc"     procfs mountpoint.
--path.sysfs="/sys"       sysfs mountpoint.
--path.rootfs="/"         rootfs mountpoint.
--collector.qdisc.fixtures=""
test fixtures to use for qdisc collector
end-to-end testing
--collector.runit.servicedir="/etc/service"
Path to runit service directory.
--collector.supervisord.url="http://localhost:9001/RPC2"
XML RPC endpoint.
--collector.systemd.unit-whitelist=".+"
Regexp of systemd units to whitelist. Units must
both match whitelist and not match blacklist to
be included.
--collector.systemd.unit-blacklist=".+\\.(automount|device|mount|scope|slice)"
Regexp of systemd units to blacklist. Units must
both match whitelist and not match blacklist to
be included.
--collector.systemd.private
Establish a private, direct connection to
systemd without dbus.
--collector.systemd.enable-task-metrics
Enables service unit tasks metrics
unit_tasks_current and unit_tasks_max
--collector.systemd.enable-restarts-metrics
Enables service unit metric
service_restart_total
--collector.systemd.enable-start-time-metrics
Enables service unit metric
unit_start_time_seconds
--collector.textfile.directory=""
Directory to read text files with metrics from.
--collector.vmstat.fields="^(oom_kill|pgpg|pswp|pg.*fault).*"
Regexp of fields to return for vmstat collector.
--collector.wifi.fixtures=""
test fixtures to use for wifi collector metrics
--collector.arp           Enable the arp collector (default: enabled).
--collector.bcache        Enable the bcache collector (default: enabled).
--collector.bonding       Enable the bonding collector (default: enabled).
--collector.buddyinfo     Enable the buddyinfo collector (default:
disabled).
--collector.conntrack     Enable the conntrack collector (default:
enabled).
--collector.cpu           Enable the cpu collector (default: enabled).
--collector.cpufreq       Enable the cpufreq collector (default: enabled).
--collector.diskstats     Enable the diskstats collector (default:
enabled).
--collector.drbd          Enable the drbd collector (default: disabled).
--collector.edac          Enable the edac collector (default: enabled).
--collector.entropy       Enable the entropy collector (default: enabled).
--collector.filefd        Enable the filefd collector (default: enabled).
--collector.filesystem    Enable the filesystem collector (default:
enabled).
--collector.hwmon         Enable the hwmon collector (default: enabled).
--collector.infiniband    Enable the infiniband collector (default:
enabled).
--collector.interrupts    Enable the interrupts collector (default:
disabled).
--collector.ipvs          Enable the ipvs collector (default: enabled).
--collector.ksmd          Enable the ksmd collector (default: disabled).
--collector.loadavg       Enable the loadavg collector (default: enabled).
--collector.logind        Enable the logind collector (default: disabled).
--collector.mdadm         Enable the mdadm collector (default: enabled).
--collector.meminfo       Enable the meminfo collector (default: enabled).
--collector.meminfo_numa  Enable the meminfo_numa collector (default:
disabled).
--collector.mountstats    Enable the mountstats collector (default:
disabled).
--collector.netclass      Enable the netclass collector (default:
enabled).
--collector.netdev        Enable the netdev collector (default: enabled).
--collector.netstat       Enable the netstat collector (default: enabled).
--collector.nfs           Enable the nfs collector (default: enabled).
--collector.nfsd          Enable the nfsd collector (default: enabled).
--collector.ntp           Enable the ntp collector (default: disabled).
--collector.perf          Enable the perf collector (default: disabled).
--collector.pressure      Enable the pressure collector (default:
enabled).
--collector.processes     Enable the processes collector (default:
disabled).
--collector.qdisc         Enable the qdisc collector (default: disabled).
--collector.runit         Enable the runit collector (default: disabled).
--collector.sockstat      Enable the sockstat collector (default:
enabled).
--collector.stat          Enable the stat collector (default: enabled).
--collector.supervisord   Enable the supervisord collector (default:
disabled).
--collector.systemd       Enable the systemd collector (default:
disabled).
--collector.tcpstat       Enable the tcpstat collector (default:
disabled).
--collector.textfile      Enable the textfile collector (default:
enabled).
--collector.time          Enable the time collector (default: enabled).
--collector.timex         Enable the timex collector (default: enabled).
--collector.uname         Enable the uname collector (default: enabled).
--collector.vmstat        Enable the vmstat collector (default: enabled).
--collector.wifi          Enable the wifi collector (default: disabled).
--collector.xfs           Enable the xfs collector (default: enabled).
--collector.zfs           Enable the zfs collector (default: enabled).
--web.listen-address=":9100"
Address on which to expose metrics and web
interface.
--web.telemetry-path="/metrics"
Path under which to expose metrics.
--web.disable-exporter-metrics
Exclude metrics about the exporter itself
(promhttp_*, process_*, go_*).
--web.max-requests=40
Maximum number of parallel scrape requests. Use 0 to disable.
--log.level="info"        Only log messages with the given severity or
above. Valid levels: [debug, info, warn, error,
fatal]
--log.format="logger:stderr"
Set the log target and format. Example:
"logger:syslog?appname=bob&local=7" or
"logger:stdout?json=true"
eos

PREFIX = 'prometheus_collector_'

puts '############################################################'
puts '# Auto generated'
puts '############################################################'
collectors = []
input.each_line do |line|
  line = line.chomp
  next if line.empty?
  if line.start_with?('--')
    argument = line[2..line.size-1].split[0]
    k = argument.split('=')

    key = k.first
    value = k.last
    boolean_flag = key == value

    if boolean_flag
      # checking if (default: enabled)
      if line =~ /: enabled/
        collectors << "  - '#{key}'"
      else
        collectors << "#  - '#{key}' # disabled by default"
      end
      next
    end

    adjusted_key = "#{PREFIX}_#{key.gsub('.', '__').gsub('-', '_')}"
    adjusted_key = adjusted_key.gsub('__collector__', '__')

    puts %Q(  - ['#{key}', "{{ #{adjusted_key} }}"])
  else
    # puts "# #{line}"
  end
end

puts '', '', ''

puts "#{PREFIX}____enabled_collectors:"
collectors.sort.each do |collector|
  puts collector
end
