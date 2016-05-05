require_relative "input"
require_relative "robot"
require_relative "grid"

class MissionControl

  attr_accessor :input, :robot_datasets, :robot, :grid_dataset, :grid, :deployed_robots, :robot_scents

  def initialize(input = Input.new)
    @input = input
  end

  def fetch_datasets
    @input.fetch_all_data
    @robot_datasets = @input.robot_datasets
    @grid_dataset = @input.grid_dataset
  end

  def create_grid
    fetch_datasets
    @grid = Grid.new(grid_coord = @grid_dataset)
  end

  def create_robot
    @deployed_robots = []
    create_grid
    grid = @grid
    @robot_datasets.each do |dataset|
      @deployed_robots << Robot.new(dataset,grid)
    end
  end

  def move_robots
    @robot_scents = []
    @deployed_robots.each do |robot|
      robot.move_robot
      # if robot.lost?
      #   @robot_scents << robot.final_position
      # end
    end
  end

end
