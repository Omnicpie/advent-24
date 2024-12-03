VALID_REGEX = /mul\(\d{1,3},\d{1,3}\)/

puts File.read('./inputs/3.txt').scan(VALID_REGEX)