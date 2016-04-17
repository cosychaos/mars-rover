class Rover

  attr_accessor :position

  def initialize(x, y, cardinal_point)
    @position = x, y, cardinal_point
  end

  def move_up_x_axis
    position[0] += 1
  end

  def move_down_x_axis
    position[0] -= 1
  end

  def move_up_y_axis
    position[1] += 1
  end

  def move_down_y_axis
    position[1] -= 1
  end

  def move_left
    if position[2] == "N"
      position.delete_at(2)
      position.insert(2, "W")
    elsif position[2] == "W"
      position.delete_at(2)
      position.insert(2, "S")
    elsif position[2] == "S"
      position.delete_at(2)
      position.insert(2, "E")
    elsif position[2] == "E"
      position.delete_at(2)
      position.insert(2, "N")
    end
  end

  def move_right
    if position[2] == "N"
      position.delete_at(2)
      position.insert(2, "E")
    elsif position[2] == "E"
      position.delete_at(2)
      position.insert(2, "S")
    elsif position[2] == "S"
      position.delete_at(2)
      position.insert(2, "W")
    elsif position[2] == "W"
      position.delete_at(2)
      position.insert(2, "N")
    end
  end

  def move
    if position[2] == "N"
      position[1] += 1
    elsif position[2] == "E"
      position[0] += 1
    elsif position[2] == "S"
      position[1] -= 1
    elsif position[2] == "W"
      position[0] -= 1
    end
  end

  def input(command_string)
    command_string.each_char {|char|
      if char == "l" || char == "L"
        self.move_left
      elsif char == "r" || char == "R"
        self.move_right
      elsif char == "m" || char == "M"
        self.move
      else
        "Rover does not understand"
      end
    }
  end

end
