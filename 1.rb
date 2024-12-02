def createArrays
  group1 = Array.new
  group2 = Array.new

  File.foreach("./inputs/1.txt") do |line| 
    numbers = line.split("   ")
    group1.push(numbers[0].to_i)
    group2.push(numbers[1].to_i)
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
counts = Array.new

set1.each_with_index do |val, index| 
  diffs.push(remove_sign(val - set2[index]))
  counter = set2.dup
  x = counter.inject(0) do |sum, n|
    if n === val 
      sum + 1
    else
      sum
    end
  end
  counts.push(x * val)
end

puts "[PART 1] Answer: #{diffs.reduce(:+)}"

puts "[PART 2] Answer: #{counts.reduce(:+)}"

