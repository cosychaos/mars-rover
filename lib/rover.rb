require_relative "grid"

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

  def turn_left
    @direction = DIRECTION_LEFT[direction]
  end

  def turn_right
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
        self.turn_left
      elsif char == "R"
        self.turn_right
      elsif char == "M"
        self.move
      else
        "Rover does not understand"
      end
    end
  end

  # def detect_scent(x,y)
  #   # grid = Grid.new(x,y)
  #   if grid.is_scented?(x,y) == true
  #     true
  #   end
  # end

  def final_position
    "Rover is at position: #{@x} #{@y} #{@direction}"
  end

end
