VALID_REGEX = /mul\(\d{1,3},\d{1,3}\)/

matches = File.read('./inputs/3.txt').scan(VALID_REGEX)

res = matches.map { |string| string.scan(/\d+/).map { |str| str.to_i }.inject(:*) }.inject(:+)
puts res