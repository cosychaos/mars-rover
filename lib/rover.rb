class Rover

  attr_accessor :position

  def initialize(x, y, cardinal_point)
    @position = x, y, cardinal_point
    @x_axis = x
    @y_axis = y
    @cardinal_point = cardinal_point
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

end
