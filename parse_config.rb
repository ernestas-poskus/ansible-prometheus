input = <<eos
eos

puts input.gsub("\t", '# ').gsub('  -', '').gsub('    ', '').
  gsub(' string', ':')
  gsub(' int', ':')
  gsub(' value', ':')

require 'yaml'
puts '# Auto generated'
YAML.load(input).each do |k, v|
  puts "#{k}: {{ #{k.gsub('.', '__').gsub('-', '_')} }}"
end
