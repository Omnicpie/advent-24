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

def x_search(x, y)
  internal_count = 0

  top_l_char = x != 0 && y != 0 ? INPUT[x - 1][y - 1] : nil 
  top_r_char = x != 0 && y != INPUT[0].length - 1? INPUT[x - 1][y + 1] : nil 
  bot_l_char = x != INPUT.length - 1 && y != 0 ? INPUT[x + 1][y - 1] : nil 
  bot_r_char =  x != INPUT.length - 1 && y != INPUT[0].length - 1?  INPUT[x + 1][y + 1] : nil 


  if top_l_char != nil && bot_r_char != nil
    if top_l_char == "M" && bot_r_char == "S"
      internal_count = internal_count + 1
    elsif top_l_char == "S" && bot_r_char == "M"
      internal_count = internal_count + 1
    end
  end

  if bot_l_char != nil && top_r_char != nil
    if bot_l_char == "M" && top_r_char == "S"
      internal_count = internal_count + 1
    elsif bot_l_char == "S" && top_r_char == "M"
      internal_count = internal_count + 1
    end
  end

  internal_count
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

part_2_count = 0 

INPUT.each_with_index do |line, line_idx|
  line.each_with_index do |char, char_idx|
    current_direction = nil
    if char == 'A' 
      if x_search(line_idx, char_idx) == 2
        part_2_count = part_2_count + 1
      end
    end
  end
end


puts "Found #{count} instances of XMAS"
puts "Found #{part_2_count} instances of X-MAS"