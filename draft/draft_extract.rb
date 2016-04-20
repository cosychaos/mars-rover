class Rover

  attr_accessor :position

  def initialize(x = [], y = [], cardinal_point = [])
    @position = x, y, cardinal_point
    # TODO - get rid of useless variables
    # @x_axis = x
    # @y_axis = y
    # @cardinal_point = cardinal_point
    @plateau = []
    @coordinates = []
    @commands = []
  end

# TODO - extract to control center
  def greeting
    puts "Please enter plateau size, coordinates and commands and hit TAB and RETURN when done"
  end

# TODO - extract to control center
  def greeting_2
    puts "Please enter coordinates and commands of second rover and hit TAB and RETURN when done"
  end

# TODO - extract to control center
  def user_input
    response = gets("\t\n").chomp
    @response_array = response.split(/\t|\n/)
  end

  def format_input
    @response_array.each do |line|
    if line.start_with?(*"0".."9") && line.end_with?(*"0".."9")
      @plateau << line
    elsif line.start_with?(*"0".."9") && line.end_with?('N', 'E', 'S', 'W')
      @coordinates << line
    elsif line.start_with?('L', 'l', 'M', 'l', 'R', 'r') && line.end_with?('L', 'l', 'M', 'm', 'R', 'r')
      @commands << line
    end
  end

# TODO - Refactor to delete arrays
  def format_coords
    @coordinates.each do |elem|
      @position.delete_at(0)
      @position.delete_at(1)
      @position.delete_at(2)
      @position.delete_at(-1)
      @position << elem.chars[0].to_i
      @position << elem.chars[1].to_i
      @position << elem.chars[2]
    end
  end

# TODO - get rid of useless variables
  def format_cmd
    # @plat_ary = @plateau[0].chars
    # @coord_ary = @coordinates[0].chars
    @cmd_ary = @commands[0].chars
  end

# TODO - refactor the logic
  def move_left
    if @position[2] == "N"
      @position.delete_at(2)
      @position.insert(2, "W")
    elsif @position[2] == "W"
      @position.delete_at(2)
      @position.insert(2, "S")
    elsif @position[2] == "S"
      @position.delete_at(2)
      @position.insert(2, "E")
    elsif @position[2] == "E"
      @position.delete_at(2)
      @position.insert(2, "N")
    end
  end

# TODO - refactor the logic
  def move_right
    if @position[2] == "N"
      @position.delete_at(2)
      @position.insert(2, "E")
    elsif @position[2] == "E"
      @position.delete_at(2)
      @position.insert(2, "S")
    elsif @position[2] == "S"
      @position.delete_at(2)
      @position.insert(2, "W")
    elsif @position[2] == "W"
      @position.delete_at(2)
      @position.insert(2, "N")
    end
  end

# TODO - refactor the logic
  def move
    if @position[2] == "N"
      @position[1] += 1
    elsif @position[2] == "E"
      @position[0] += 1
    elsif @position[2] == "S"
      @position[1] -= 1
    elsif @position[2] == "W"
      @position[0] -= 1
    end
  end

# TODO - Refactor the logic
  def move_rover
    @cmd_ary.each do |char|
      if char == "l" || char == "L"
        self.move_left
      elsif char == "r" || char == "R"
        self.move_right
      elsif char == "m" || char == "M"
        self.move
      else
        "Rover does not understand"
      end
    end
  end

  def final_position
    array = @position.flatten.join(" ")
    print "Rover is at position: " + array + "  \n"
  end

end

# TODO - extract to control center/programme runner
rover = Rover.new
rover.greeting
rover.user_input
rover.format_input
rover.format_coords
rover.format_cmd
rover.move_rover
rover.final_position
rover2 = Rover.new
rover2.greeting_2
rover2.user_input
rover2.format_input
rover2.format_coords
rover2.format_cmd
rover2.move_rover
rover2.final_position
end
