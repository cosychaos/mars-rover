require_relative "grid"

class Rover

attr_accessor :x, :y, :orientation, :commands

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

  def initialize(array)
    @x = array[0]
    @y = array[1]
    @orientation = array[2]
    @commands = array[3]
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

  def move_rover(command, grid)
    command.each do |command|
      command == "F" ? self.move_forward(grid) : self.turn(command)
    end
  end

  def ignore_forward?(grid)
    grid.is_scented?(self.x,self.y, self.orientation)
  end

end
