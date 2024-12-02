def createArrays
  group1 = Array.new
  group2 = Array.new

  File.foreach("./inputs/1.txt") do |line| 
    numbers = line.split("   ")
    group1.push(numbers[0])
    group2.push(numbers[1])
  end

  [group1, group2]
end

def remove_sign(n)
  return n unless n < 0

  n * -1
end

# Make arrays from inputs
set1, set2 = createArrays

puts set1[0]
puts set2[0]
set1.sort!
set2.sort!

diffs = Array.new

set2.each_with_index {|val, index| diffs.push(remove_sign(val.to_i - set1[index].to_i)) }
puts "Answer: #{diffs.reduce(:+)}"


