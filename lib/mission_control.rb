# # initialises rovers depending on how many pieces of robot_data there are
# # initialises a grid depending on the grid_data available
# # check if robot would go beyond boundaries before every command if !is_scented
# # if robot is_lost it sets_scent to last position it was at
# # writes to new file  the new position of the rovers
#

require_relative "input"

class MissionControl

attr_accessor :input, :robot_pairs, :grid_data

def initialize(input = Input.new)
  @input = input
end

def fetch_input
  @robot_pairs = @input.robot_pairs
  @grid_data = @input.formatted_grid_data
end

# def create_rover(robot_pairs)
#   robot_pairs.each do |pair|
#     Rover.new(pair)
#   end
# end

end
#
# def main
# input =`Input.new
# input.parse_file
# a=input.extract_robots_data
#
# create_rovers(a) // Rover new (1,1,e,rrrrr), ``roverNew
# create_grid
# rover.move_rover
# roover.moverover(input.getrbtdata.commands,grid)
# end
