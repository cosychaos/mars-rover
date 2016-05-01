
class Rover

attr_accessor :x, :y, :direction

DIRECTION_LEFT = {
  "N" => "W",
  "W" => "S",
  "S" => "E",
  "E" => "N"
}

DIRECTION_RIGHT = {
  "N" => "E",
  "E" => "S",
  "S" => "W",
  "W" => "N"
}

  def initialize(x, y, direction)
    @x = x
    @y = y
    @direction = direction
  end

def move_left
  @direction = DIRECTION_LEFT[direction]
end

def move_right
  @direction = DIRECTION_RIGHT[direction]
end

  def move
    return @y += 1 if @direction == "N"
    return @x += 1 if @direction == "E"
    return @y -= 1 if @direction == "S"
    return @x -= 1 if @direction == "W"
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
