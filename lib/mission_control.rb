require_relative "input"
require_relative "robot"
require_relative "grid"

class MissionControl

  attr_accessor :input, :robot_datasets, :robot, :grid_dataset, :grid, :deployed_robots

  def initialize(input = Input.new)
    @input = input
  end

  def fetch_datasets
    @input.fetch_all_data
    @robot_datasets = @input.robot_datasets
    @grid_dataset = @input.grid_dataset
  end

  def create_grid
    self.fetch_datasets
    @grid = Grid.new(grid_coord = @grid_dataset)
  end

  def create_robot
    @deployed_robots = []
    self.create_grid
    self.fetch_datasets
    grid = @grid
    @robot_datasets.each do |dataset|
      @deployed_robots << Robot.new(dataset,grid)
    end
  end

  def move_robots
    @deployed_robots.each do |robot|
      robot.move_robot
    end
  end

end
