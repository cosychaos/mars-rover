require_relative "mission_control"

class Robot

attr_accessor :x, :y, :orientation, :commands, :position_log, :last_seen, :status, :final_position, :safe_positions, :forward_positions, :status

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

  # def lost?
  #   @lost
  # end
  #
  # def safe
  #   @lost = false
  # end
  #
  # def lost
  #   @lost = true
  # end

  def check_status
    if is_lost?
      @status = "LOST"
    else
      @status = "SAFE"
    end
  end

  def turn(direction)
    @orientation = Robot.const_get(direction)[orientation]
  end

  def move_forward(grid)
    grid = @grid
    # return if ignore_forward?
    @y += 1 if @orientation == "N"
    @x += 1 if @orientation == "E"
    @y -= 1 if @orientation == "S"
    @x -= 1 if @orientation == "W"
  end

  def follow_commands(command)
    grid = @grid
      command == "F" ? begin move_forward(grid) ; record_position end : turn(command)
  end

  # begin move_forward(grid); @forward_positions << @x << @y << @orientation end

  def is_lost?
    @x < 0 || @y < 0 || @x > @grid.x || @y > @grid.y
  end

  def record_position
    if @status == "LOST"
      position = []
      position << @x << @y << @orientation
      @forward_positions = {}
      @forward_positions[position] = @status
    end
  end

  def fetch_last_seen
    @last_seen = []
    @position_log = []
    @safe_positions = []
    @position_log = @forward_positions.each_slice(3).to_a
    @position_log.each do |position|
      if position[0] <= @grid.x && position[1] <= @grid.y
        @safe_positions << position
      else
        @last_seen << position
      end
    end
    @last_seen = @safe_positions[-1]
  end

  # def ignore_forward?
  #   grid = @grid
  #   grid.is_scented?(grid.x,grid.y,grid.orientation)
  # end

  def fetch_final_position
    fetch_last_seen
    @final_position = []
    if status == "SAFE"
      @final_position << @x << @y << @orientation
    else
      @final_position << @last_seen[0] << @last_seen[1] << @last_seen[2]
    end
  end

  def move_robot
    @forward_positions = []
    @commands.each_char do |command|
      follow_commands(command)
      check_status
      # record_position
      # fetch_final_position
    end
  end

end
