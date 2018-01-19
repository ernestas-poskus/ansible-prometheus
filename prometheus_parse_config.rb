input = <<eos
--config.file="alertmanager.yml"
			 Alertmanager configuration file name.
--storage.path="data/"     Base path for data storage.
--data.retention=120h      How long to keep data for.
--alerts.gc-interval=30m   Interval between alert GC.
--log.level=info           Only log messages with the given severity or
			 above.
--web.external-url=WEB.EXTERNAL-URL
			 The URL under which Alertmanager is externally
			 reachable (for example, if Alertmanager is
			 served via a reverse proxy). Used for
			 generating relative and absolute links back to
			 Alertmanager itself. If the URL has a path
			 portion, it will be used to prefix all HTTP
			 endpoints served by Alertmanager. If omitted,
			 relevant URL components will be derived
			 automatically.
--web.route-prefix=WEB.ROUTE-PREFIX
			 Prefix for the internal routes of web
			 endpoints. Defaults to path of
			 --web.external-url.
--web.listen-address=":9093"
			 Address to listen on for the web interface and
			 API.
--mesh.listen-address="0.0.0.0:6783"
			 mesh listen address. Pass an empty string to
			 disable.
--mesh.peer-id="ac:fd:ce:89:c3:ee"
			 mesh peer ID
--mesh.nickname="ow"       mesh peer nickname
--mesh.password=""         password to join the peer network (empty
			 password disables encryption)
--mesh.peer=MESH.PEER ...  initial peers (may be repeated)
eos

PREFIX = 'prometheus_alert_manager'

puts '############################################################'
puts '# Auto generated'
puts '############################################################'
buffer = []
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
      buffer << %Q(  - ['#{key}', "{{ #{adjusted_key} }}"])
    end
  else
    # buffer << "# #{line}"
  end
end

puts buffer.sort.join("\n")

puts '', '', ''

puts "#{PREFIX}____enabled_flags:"
flags.sort.each do |bool|
  puts bool
end
