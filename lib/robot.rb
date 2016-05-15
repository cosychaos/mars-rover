require_relative "mission_control"

class Robot

attr_accessor :x, :y, :orientation, :commands, :prev_x, :prev_y

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

  def initialize(dataset, grid)
    @x = dataset[0]
    @y = dataset[1]
    @orientation = dataset[2]
    @commands = dataset[3]
    @grid = grid
  end

  def turn(direction)
    @orientation = Robot.const_get(direction)[orientation]
  end

  def move_forward
    return if @grid.is_scented?(@x,@y, @orientation)
    @y += 1 if @orientation == "N"
    @x += 1 if @orientation == "E"
    @y -= 1 if @orientation == "S"
    @x -= 1 if @orientation == "W"
  end

  def follow_commands(command)
    if command == "F"
      move_forward
    else
      turn(command)
    end
  end

  def is_lost?
    @x < 0 || @y < 0 || @x > @grid.x || @y > @grid.y
  end

  def move_robot
    @commands.each_char do |command|
      prev_x = @x
      prev_y = @y
      prev_orientation = @orientation

      follow_commands(command)
      if is_lost?
        return [prev_x, prev_y, prev_orientation, true]
      end
    end
    return [@x, @y, @orientation, false]
  end
end
