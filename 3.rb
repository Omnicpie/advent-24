VALID_REGEX = /mul\(\d{1,3},\d{1,3}\)/
START_STRING_REGEX = /.*?don't\(\)/
MIDDLE_STRING_REGEX = /do\(\).*?don't\(\)/
END_STRING_REGEX_PART_1 = /^.*?\)\(t'nod/
END_STRING_REGEX_PART_2 = /do\(\).*?$/

matches = File.read('./inputs/3.txt').scan(VALID_REGEX)
middle = File.read('./inputs/3.txt').scan(MIDDLE_STRING_REGEX)
middle_matches = middle.map{|str| str.scan(VALID_REGEX)}.flatten
start_matches = START_STRING_REGEX.match(File.read('./inputs/3.txt')).to_s.scan(VALID_REGEX)
end_matches = END_STRING_REGEX_PART_2.match(END_STRING_REGEX_PART_1.match(File.read('./inputs/3.txt').reverse).to_s.reverse).to_s.scan(VALID_REGEX)

puts "start matches: #{start_matches.length}"
puts "  mid matches: #{middle_matches.length}"
puts "  end matches: #{end_matches.length}"


start_count = start_matches.map { |string| string.scan(/\d+/).map { |str| str.to_i }.inject(:*) }.inject(:+)
end_count = end_matches.map { |string| string.scan(/\d+/).map { |str| str.to_i }.inject(:*) }.inject(:+)
middle_count = middle_matches.map { |string| string.scan(/\d+/).map { |str| str.to_i }.inject(:*) }.inject(:+)
count = matches.map { |string| string.scan(/\d+/).map { |str| str.to_i }.inject(:*) }.inject(:+)

puts "part 1: #{count}"
puts "part 2: #{start_count + middle_count + end_count}"