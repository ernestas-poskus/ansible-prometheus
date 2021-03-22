input = <<eos
--config.file="prometheus.yml"
Prometheus configuration file path.
--web.listen-address="0.0.0.0:9090"
Address to listen on for UI, API, and
telemetry.
--web.config.file=""       [EXPERIMENTAL] Path to configuration file that
can enable TLS or authentication.
--web.read-timeout=5m      Maximum duration before timing out read of the
request, and closing idle connections.
--web.max-connections=512  Maximum number of simultaneous connections.
--web.external-url=<URL>   The URL under which Prometheus is externally
reachable (for example, if Prometheus is served
via a reverse proxy). Used for generating
relative and absolute links back to Prometheus
itself. If the URL has a path portion, it will
be used to prefix all HTTP endpoints served by
Prometheus. If omitted, relevant URL components
will be derived automatically.
--web.route-prefix=<path>  Prefix for the internal routes of web
endpoints. Defaults to path of
--web.external-url.
--web.user-assets=<path>   Path to static asset directory, available at
/user.
--web.enable-lifecycle     Enable shutdown and reload via HTTP request.
--web.enable-admin-api     Enable API endpoints for admin control actions.
--web.console.templates="consoles"
Path to the console template directory,
available at /consoles.
--web.console.libraries="console_libraries"
Path to the console library directory.
--web.page-title="Prometheus Time Series Collection and Processing Server"
Document title of Prometheus instance.
--web.cors.origin=".*"     Regex for CORS origin. It is fully anchored.
Example: 'https?://(domain1|domain2)\.com'
--storage.tsdb.path="data/"
Base path for metrics storage.
--storage.tsdb.retention=STORAGE.TSDB.RETENTION
[DEPRECATED] How long to retain samples in
storage. This flag has been deprecated, use
"storage.tsdb.retention.time" instead.
--storage.tsdb.retention.time=STORAGE.TSDB.RETENTION.TIME
How long to retain samples in storage. When
this flag is set it overrides
"storage.tsdb.retention". If neither this flag
nor "storage.tsdb.retention" nor
"storage.tsdb.retention.size" is set, the
retention time defaults to 15d. Units
Supported: y, w, d, h, m, s, ms.
--storage.tsdb.retention.size=STORAGE.TSDB.RETENTION.SIZE
[EXPERIMENTAL] Maximum number of bytes that can
be stored for blocks. A unit is required,
supported units: B, KB, MB, GB, TB, PB, EB. Ex:
"512MB". This flag is experimental and can be
changed in future releases.
--storage.tsdb.no-lockfile
Do not create lockfile in data directory.
--storage.tsdb.allow-overlapping-blocks
[EXPERIMENTAL] Allow overlapping blocks, which
in turn enables vertical compaction and
vertical query merge.
--storage.tsdb.wal-compression
Compress the tsdb WAL.
--storage.remote.flush-deadline=<duration>
How long to wait flushing sample on shutdown or
config reload.
--storage.remote.read-sample-limit=5e7
Maximum overall number of samples to return via
the remote read interface, in a single query. 0
means no limit. This limit is ignored for
streamed response types.
--storage.remote.read-concurrent-limit=10
Maximum number of concurrent remote read calls.
0 means no limit.
--storage.remote.read-max-bytes-in-frame=1048576
Maximum number of bytes in a single frame for
streaming remote read response types before
marshalling. Note that client might have limit
on frame size as well. 1MB as recommended by
protobuf by default.
--rules.alert.for-outage-tolerance=1h
Max time to tolerate prometheus outage for
restoring "for" state of alert.
--rules.alert.for-grace-period=10m
Minimum duration between alert and restored
"for" state. This is maintained only for alerts
with configured "for" time greater than grace
period.
--rules.alert.resend-delay=1m
Minimum amount of time to wait before resending
an alert to Alertmanager.
--alertmanager.notification-queue-capacity=10000
The capacity of the queue for pending
Alertmanager notifications.
--query.lookback-delta=5m  The maximum lookback duration for retrieving
metrics during expression evaluations and
federation.
--query.timeout=2m         Maximum time a query may take before being
aborted.
--query.max-concurrency=20
Maximum number of queries executed
concurrently.
--query.max-samples=50000000
Maximum number of samples a single query can
load into memory. Note that queries will fail
if they try to load more samples than this into
memory, so this also limits the number of
samples a query can return.
--enable-feature= ...      Comma separated feature names to enable. Valid
options: 'promql-at-modifier' to enable the @
modifier, 'remote-write-receiver' to enable
remote write receiver. See
https://prometheus.io/docs/prometheus/latest/disabled_features/
for more details.
--log.level=info           Only log messages with the given severity or
above. One of: [debug, info, warn, error]
--log.format=logfmt        Output format of log messages. One of: [logfmt,json]
eos

exporter = ARGV[0]

prefix = ['prometheus', exporter].compact.join('_')

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

    adjusted_key = "#{prefix}_#{key.gsub('.', '__').gsub('-', '_')}"
    adjusted_key = adjusted_key.gsub("__#{exporter}__", '__')

    puts %Q(  - ['#{key}', "{{ #{adjusted_key} }}"])
  else
    # puts "# #{line}"
  end
end

puts '', '', ''

puts "#{prefix}____enabled_flags:"
collectors.sort.each do |collector|
  puts collector
end
