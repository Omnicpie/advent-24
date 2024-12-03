lines = Array.new
File.foreach("./inputs/2.txt") do |line| 
  numbers = line.split(" ").map { |str| str.to_i }
  lines.push(numbers)
end

safe_reports = lines.reduce(0) do |product, n| 
  
  grouped = n.zip(n.rotate(1))
  grouped.pop
  increasing = n.each_cons(2).all? { |a, b| (a <=> b) <= 0 }
  decreasing = n.each_cons(2).all? { |a, b| (a <=> b) > 0 }

  
  outside_allowed_value_change = grouped.select {|v| (v[0] - v[1]).abs < 1 || (v[0] - v[1]).abs  > 3 }
  outside_allowed_value_change.length > 0 || (increasing || decreasing) != true ? product : product + 1
end

puts "Safe Reports: #{safe_reports}"