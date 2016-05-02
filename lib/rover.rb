require_relative "grid"

class Rover

attr_accessor :x, :y, :orientation

L = {
  "N" => "W",
  "W" => "S",
  "S" => "E",
  "E" => "N"
}

R = {
  "N" => "E",
  "E" => "S",
  "S" => "W",
  "W" => "N"
}

  def initialize(x, y, orientation)
    @x = x
    @y = y
    @orientation = orientation
  end

  def turn(direction)
    @orientation = Rover.const_get(direction)[orientation]
  end

  def move_forward(grid)
    return if ignore_forward?(grid)
    @y += 1 if @orientation == "N"
    @x += 1 if @orientation == "E"
    @y -= 1 if @orientation == "S"
    @x -= 1 if @orientation == "W"
  end

  def move_rover(commands, grid)
    commands.each do |command|
      command == "F" ? self.move_forward(grid) : self.turn(command)
    end
  end

  def ignore_forward?(grid)
    grid.is_scented?(self.x,self.y, self.orientation)
  end

end
