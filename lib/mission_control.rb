# ++ # initialises rovers depending on how many pieces of robot_data there are
# # initialises a grid depending on the grid_data available
# # check if robot would go beyond boundaries before every command if !is_scented
# # if robot is_lost it sets_scent to last position it was at
# # writes to new file  the new position of the rovers
#

require_relative "input"
require_relative "rover"
require_relative "grid"

class MissionControl

attr_accessor :input, :robot_datasets, :grid_dataset, :grid, :deployed_robots

def initialize(input = Input.new)
  @input = input
end

def fetch_datasets
  @input.fetch_all_data
  @robot_datasets = @input.robot_datasets
  @grid_dataset = @input.grid_dataset
end

def create_robot
  self.fetch_datasets
  @deployed_robots = @robot_datasets.each do |dataset|
       Rover.send(:new, "rover")
  end
end

def create_grid
  self.fetch_datasets
  grid_coord = @grid_dataset
  @grid = Grid.new(grid_coord)
end

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
