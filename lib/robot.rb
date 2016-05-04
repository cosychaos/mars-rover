require_relative "mission_control"

class Robot

attr_accessor :x, :y, :orientation, :commands, :position_log, :last_seen

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

  def move_forward(grid)
    # grid = @grid
    # return if ignore_forward?
    @y += 1 if @orientation == "N"
    @x += 1 if @orientation == "E"
    @y -= 1 if @orientation == "S"
    @x -= 1 if @orientation == "W"
  end

  def move_robot
    grid = @grid
    forward_positions = []
    @commands.each_char do |command|
      command == "F" ? begin self.move_forward(grid); forward_positions << @x << @y << @orientation end : self.turn(command)
    end
    @position_log = forward_positions.each_slice(3).to_a
  end

  def is_lost?
    @x < 0 || @y < 0 || @x > @grid.x || @y > @grid.y
  end

  def fetch_last_seen
    @last_seen = []
    safe_positions = []
    @position_log.each do |position|
      safe_positions << position if position[1] <= @grid.y && position[0] <= @grid.x
    end
    @last_seen = safe_positions[-1]
  end

  def gets_lost
    self.is_lost? ? self.fetch_last_seen : "Robot is not lost"
  end

  def ignore_forward?
    grid = @grid
    grid.is_scented?(grid.x,grid.y,grid.orientation)
  end

end
