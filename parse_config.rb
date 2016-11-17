input = <<eos
eos

PREFIX = 'prometheus_alert_manager'

puts '############################################################'
puts '# Auto generated'
puts '############################################################'
input.each_line do |line|
  line = line.chomp
  next if line.empty?
  if line.start_with?('-')
    argument = line[1..line.size-1].split[0]
    puts %Q(#{argument}: "{{ #{PREFIX}_#{argument.gsub('.', '__').gsub('-', '_')} }}")
  else
    # puts "# #{line}"
  end
end
