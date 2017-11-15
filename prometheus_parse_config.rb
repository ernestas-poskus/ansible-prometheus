input = <<eos
--config.file="prometheus.yml"
Prometheus configuration file path.
--web.listen-address="0.0.0.0:9090"
Address to listen on for UI, API, and
telemetry.
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
endpoints. Defaults to path of --web.external-url.
--web.user-assets=<path>   Path to static asset directory, available at /user.
--web.enable-lifecycle     Enable shutdown and reload via HTTP request.
--web.enable-admin-api     Enables API endpoints for admin control actions.
--web.console.templates="consoles"
Path to the console template directory, available at /consoles.
--web.console.libraries="console_libraries"
Path to the console library directory.
--storage.tsdb.path="data/"
Base path for metrics storage.
--storage.tsdb.min-block-duration=2h
Minimum duration of a data block before being
persisted.
--storage.tsdb.max-block-duration=<duration>
Maximum duration compacted blocks may span.
(Defaults to 10% of the retention period)
--storage.tsdb.retention=15d
How long to retain samples in the storage.
--storage.tsdb.no-lockfile
Do not create lockfile in data directory.
--alertmanager.notification-queue-capacity=10000
The capacity of the queue for pending alert
manager notifications.
--alertmanager.timeout=10s
Timeout for sending alerts to Alertmanager.
--query.lookback-delta=5m
The delta difference allowed for retrieving metrics during expression evaluations.
--query.timeout=2m         Maximum time a query may take before being aborted.
--query.max-concurrency=20
Maximum number of queries executed concurrently.
--log.level=info           Only log messages with the given severity or
above. One of: [debug, info, warn, error]
eos

PREFIX = 'prometheus'

puts '############################################################'
puts '# Auto generated'
puts '############################################################'
flags = []
input.each_line do |line|
  line = line.chomp
  next if line.empty?
  if line.start_with?('--')
    argument = line[2..line.size-1].split[0]
    k = argument.split('=')

    key = k.first
    value = k.last
    boolean_flag = key == value
    adjusted_key = "#{PREFIX}_#{key.gsub('.', '__').gsub('-', '_')}"

    if boolean_flag
      if line =~ /: enabled/
        flags << "  - '#{key}'"
      else
        flags << "#  - '#{key}' # disabled by default"
      end
    else
      puts %Q(  - ['#{key}', "{{ #{adjusted_key} }}"])
    end
  else
    # puts "# #{line}"
  end
end

puts '', '', ''

puts "#{PREFIX}____enabled_flags:"
flags.sort.each do |bool|
  puts bool
end
