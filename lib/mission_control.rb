require_relative 'rover'

class MissionControl

  attr_accessor :coordinates, :commands, :position, :response_array, :cmd_ary, :rover

  def initialize
    @plateau = []
    @coordinates = []
    @commands = []
  end

  def greetings
    puts "Please enter plateau size, coordinates and commands (no spaces) and hit TAB and RETURN when done"
  end

  def greetings_2
    puts "Please enter coordinates and commands of second rover (no spaces) and hit TAB and RETURN when done"
  end

  def user_input
    response = gets("\t\n").chomp
    @response_array = response.split(/\t|\n/)
  end

  def format_input
    response_array.each do |line|
    if line.start_with?(*"0".."9") && line.end_with?(*"0".."9")
      @plateau << line
    elsif line.start_with?(*"0".."9") && line.end_with?('N', 'E', 'S', 'W')
      @coordinates << line
    elsif line.start_with?('L', 'l', 'M', 'l', 'R', 'r') && line.end_with?('L', 'l', 'M', 'm', 'R', 'r')
      @commands << line.chars
    end
  end

  def format_coords
    @position = []

    coordinates.each do |elem|
      position << elem.chars[0].to_i
      position << elem.chars[1].to_i
      position << elem.chars[2]
    end
  end

  def format_cmd
    @cmd_ary = commands[0].chars
  end

  def create_rover
    @rover = Rover.new(position, commands[0])
  end

end

mission_control = MissionControl.new
mission_control.greetings
mission_control.user_input
mission_control.format_input
mission_control.format_coords
mission_control.create_rover
mission_control.rover.move_rover
mission_control.rover.final_position
# mission_control.create_rover
# mission_control.greetings_2

end
