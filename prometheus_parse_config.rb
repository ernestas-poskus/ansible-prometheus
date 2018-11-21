input = <<eos
eos

PREFIX = 'prometheus'

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
