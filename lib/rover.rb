
class Rover

attr_accessor :x, :y, :direction

  def initialize(x, y, direction)
    @x = x
    @y = y
    @direction = direction
  end

  def move_left
    if @direction == "N"
      @direction = "W"
    elsif @direction == "W"
      @direction = "S"
    elsif @direction == "S"
      @direction = "E"
    elsif @direction == "E"
      @direction = "N"
    end
  end

  def move_right
    if @direction == "N"
      @direction = "E"
    elsif @direction == "E"
      @direction = "S"
    elsif @direction == "S"
      @direction = "W"
    elsif @direction == "W"
      @direction = "N"
    end
  end

  def move
    if @direction == "N"
      @y += 1
    elsif @direction == "E"
      @x += 1
    elsif @direction == "S"
      @y -= 1
    elsif @direction == "W"
      @x -= 1
    end
  end

  def move_rover(commands)
    commands.each do |char|
      if char == "L"
        self.move_left
      elsif char == "R"
        self.move_right
      elsif char == "M"
        self.move
      else
        "Rover does not understand"
      end
    end
  end

  def final_position
    "Rover is at position: #{@x} #{@y} #{@direction}"
  end

end
