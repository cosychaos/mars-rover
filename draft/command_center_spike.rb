require_relative "rover"

class Commandcenter

  # def initialize()
  #   @rover = Rover.new(coordinates_array[0], coordinates_array[1], coordinates_array[2])
  # end

  # puts 'WELCOME TO THE NASA MARS ROVER PROGRAM CENTER'
  # puts 'INITIALIZE NEW ROVER?'
  # reply_initialise = gets.chomp.downcase
  #
  # if reply_initialise == "yes"
  #   puts "PLEASE ENTER COORDINATES"
  #   # AND COMMANDS, FOLLOWED BY 'END'
  #   # $/ = "END"
  #   # user_input = STDIN.gets
  #   coordinates = gets.chomp
  #   coordinates_array = coordinates.chars
  #   # puts coordinates_array
  #   # @rover = Rover.new(coordinates_array[0], coordinates_array[1], coordinates_array[2])
  #   puts @rover
  # else
  #   puts "ROVER NOT INITIALIZED."
  #   puts "THANK YOU FOR YOUR VISIT."
  # end

  def initialize(x = 0, y = 0, cardinal_point = n)
    @position = x, y, cardinal_point
    @x_axis = x
    @y_axis = y
    @cardinal_point = cardinal_point
  end

  # def initialize (commands_class = Commands, str)
  #   @commands = commands_class.new(str)
  # end

  def user_input
    puts "Please enter coordinates and commands and hit TAB and RETURN when done"
    response = gets("\t\n").chomp
    resp_ary = response.split(/\t|\n/)
    plateau = [] #=> Will serve for edge cases/error handling |IMPLEMENT METHOD|
    coordinates = [] #=> needed to be passed to the commands/initialise a rover with the coordinates |HOW?|
    commands = [] #=> needed to be passed as the command_string to the #input method

    resp_ary.each do |line|
      if line.start_with?(*"0".."9") && line.end_with?(*"0".."9")
        plateau << line
      elsif line.start_with?(*"0".."9") && line.end_with?('N', 'E', 'S', 'W')
        coordinates << line
      elsif line.start_with?('L', 'l', 'M', 'l', 'R', 'r') && line.end_with?('L', 'l', 'M', 'm', 'R', 'r')
        commands << line
      end
    end

    coordinates.each do |elem|
      elem_ary = elem.chars
      self.new(elem_ary[0], elem_ary[1], elem_ary[2])
    end
  end


# ["12N", "33E"]
#
#   for each set of coordinates in the array,
#     turn that set into an array
#     initialise a new rover with x = set[z][0], y = set[z][1] and cardinal_point = set[z][2]

  plat_ary = plateau[0].chars
  coord_ary = coordinates[0].chars
  cmd_ary = commands[0].chars

# ^^^ CAN'T DO THIS BECAUSE WHAT IF SEVERAL ROVERS?

  print plat_ary
  print coord_ary
  print cmd_ary

  new_cmd_ary = cmd_ary[0].chars #=> the cmd_ary is a string in an array.
                                 #In order to turn the string into an array,
                                 #we need to go one level deep, and use #chars

  new_cmd_ary.each {|char|
    if char == "l" || char == "L"
      print "test has passed"
    elsif char == "r" || char == "R"
      print "test has also passed"
    elsif char == "m" || char == "M"
      print "test has passed as well"
    else
      "test has failed"
    end
  }

  # resp_ary.each do |line|
  #   if line.start_with?(/(\d)/) && line.end_with?(/(\d)/)
  #     plat_ary << line
  #   elsif line.start_with?(/(\d)/) && line.end_with?(/([a-zA-Z])/)
  #     coord_ary << line
  #   elsif line.start_with?(/([a-zA-Z])/) && line.end_with?(/([a-zA-Z])/)
  #     cmd_ary << line
  #   end
  # end
  # array = response.chars
  # puts array
  # $/ = "END"
  # user_input = STDIN.gets
  # response.each do |line|
  #   puts line + "BOB"
  # end
  # ARGV.argv

end

# if line.start_with?(/\d/) && line.end_with?(/\d/)
#   plat_ary << shovel
# elsif line.start_with?(/\d/) && line.end_with?(/[a-zA-Z]/)
#   coord_ary << shovel
# elsif line.start_with?(/[a-zA-Z]/) && line.end_with?(/[a-zA-Z]/)
#   cmd_ary << shovel
# end

rover = Rover.new
# => initialise new rover
rover.get_input
# => get input from user
# => turn strings into arrays for consumption by other methods
# => pushes coordinates to initialise
rover.move_rover
# => moves the rover
rover.position
# => prints the current position


# TODO - extract to control center/programme runner
# rover = Rover.new
# rover.greeting
# rover.user_input
# rover.format_input
# rover.format_coords
# rover.format_cmd
# rover.move_rover
# rover.final_position
# rover2 = Rover.new
# rover2.greeting_2
# rover2.user_input
# rover2.format_input
# rover2.format_coords
# rover2.format_cmd
# rover2.move_rover
# rover2.final_position
# end
