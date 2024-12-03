VALID_REGEX = /mul\(\d{1,3},\d{1,3}\)/
ENABLING_REGEX = /(mul\(\d{1,3},\d{1,3}\)|do\(\)|don't\(\))/
NUMBER_REGEX = /\d+/

basic_matches = File.read('./inputs/3.txt').scan(VALID_REGEX)
matches_with_on_off = File.read('./inputs/3.txt').scan(ENABLING_REGEX).flatten

count = basic_matches.map { |string| string.scan(NUMBER_REGEX).map { |str| str.to_i }.inject(:*) }.inject(:+)

enabled = true
mul = []

for item in matches_with_on_off do
  if item.match(/do\(\)/)
    enabled = true
  elsif item.match(/don't\(\)/)
    enabled = false
  else
    if enabled
      mul.push(item.scan(NUMBER_REGEX).map { |str| str.to_i }.inject(:*))
    end
  end
end

puts "part 1: #{count}"
puts "part 2: #{mul.inject(:+)}"