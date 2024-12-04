DIRECTIONS = {
  up: [-1, 0],
  down: [1, 0],
  left: [0, -1],
  right: [0, 1],
  up_left: [-1, -1],
  up_right: [-1, 1],
  down_left: [1, -1],
  down_right: [1, 1],
}
count = 0
INPUT = []



def search(x, y, letter, directionality)
  if directionality == nil
    matching_directions = DIRECTIONS.find_all do | key, value |
      new_x = x + value[0]
      new_y = y + value[1]
      if(new_x >= 0 && new_y >= 0 && new_x < INPUT.length && new_y < INPUT[x].length)
       char = INPUT[new_x][new_y]
       char == letter
      else
        false
      end
    end
    matched = matching_directions.find_all do | matching_direction |
      dir = DIRECTIONS[matching_direction[0]] 
      new_x = x + dir[0]
      new_y = y + dir[1]
      search(new_x, new_y, "A", matching_direction[0]) == 1
    end
    return matched.length
  else
    dir = DIRECTIONS[directionality] 
    new_x = x + dir[0]
    new_y = y + dir[1]
    char = nil
    if(new_x >= 0 && new_y >= 0 && new_x < INPUT.length && new_y < INPUT[x].length)
      char = INPUT[new_x][new_y]
    end

    if char != nil && char == letter
      if letter == "S"
        return 1
      else
        return search(new_x, new_y, "S", directionality)
      end
    end
  end
end


File.foreach("inputs/4.txt") { |line|
INPUT.push(line.chomp().chars())
}

INPUT.each_with_index do |line, line_idx|
  line.each_with_index do |char, char_idx|
    current_direction = nil
    if char == 'X' 
        count = count + search(line_idx, char_idx, "M", nil)
    end
  end
end


puts "Found #{count} instances of XMAS"