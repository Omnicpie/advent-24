lines = Array.new
File.foreach("./inputs/2.txt") do |line| 
  numbers = line.split(" ").map { |str| str.to_i }
  lines.push(numbers)
end

def checkArrayValid array 
  grouped = array.zip(array.rotate(1))
  grouped.pop
  increasing = array.each_cons(2).all? { |a, b| (a <=> b) <= 0 }
  decreasing = array.each_cons(2).all? { |a, b| (a <=> b) > 0 }

  
  outside_allowed_value_change = grouped.select {|v| (v[0] - v[1]).abs < 1 || (v[0] - v[1]).abs  > 3 }
  outside_allowed_value_change.length > 0 || (increasing || decreasing) != true ? false : true
end

safe_reports = lines.reduce(0) do |product, n| 
    if(checkArrayValid(n)) 
      product + 1
    else
      #Check with 1 removed to find other potential safes
      found_safe =false
      n.each_index do |index|
        v = n.reject.with_index{|v, i| i == index }
        if(checkArrayValid(v))
          found_safe = true
        end
      end 
      if found_safe
        product + 1
      else
        product
      end
    end
end

puts "Safe Reports: #{safe_reports}"