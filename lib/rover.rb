class Rover

  attr_accessor :position

  CARDINAL_POINTS = ["N", "W", "S", "E"]

  def initialize(x, y, cardinal_point)
    @position = x, y, cardinal_point
    # @x_axis = x
    # @y_axis = y
    # @cardinal_point = cardinal_point
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

end
