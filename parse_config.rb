input = <<eos
-log.format value
If set use a syslog logger or JSON logging. Example: logger:syslog?appname=bob&local=7 or logger:stdout?json=true. Defaults to stderr.
-log.level value
Only log messages with the given severity or above. Valid levels: [debug, info, warn, error, fatal].
-persistence.file string
File to persist metrics. If empty, metrics are only kept in memory.
-persistence.interval duration
The minimum interval at which to write out the persistence file. (default 5m0s)
-version
Print version information.
-web.listen-address string
Address to listen on for the web interface, API, and telemetry. (default ":9091")
-web.telemetry-path string
Path under which to expose metrics. (default "/metrics")
eos

PREFIX = 'prometheus_push_gateway'

puts '############################################################'
puts '# Auto generated'
puts '############################################################'
input.each_line do |line|
  line = line.chomp
  next if line.empty?
  if line.start_with?('-')
    argument = line[1..line.size-1].split[0]
    puts %Q(  - ['#{argument}', "{{ #{PREFIX}_#{argument.gsub('.', '__').gsub('-', '_')} }}"])
  else
    # puts "# #{line}"
  end
end
