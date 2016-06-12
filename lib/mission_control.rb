require_relative "input"
require_relative "robot"
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

  def check_input
    @input.check_input
  end

  def create_grid
    fetch_datasets
    @grid = Grid.new(grid_coord = @grid_dataset)
  end

  def create_robots
    @deployed_robots = []
    create_grid
    grid = @grid
    @robot_datasets.each do |dataset|
      @deployed_robots << Robot.new(dataset,grid)
    end
  end

  def move_robots
    create_robots
    @deployed_robots.each do |robot|
      x, y, orientation, lost = robot.move_robot
      if lost
        @grid.set_scent(x, y, orientation)
        print "#{x} #{y} #{orientation} LOST\n"
      else
        print "#{x} #{y} #{orientation}\n"
      end
    end
  end

end
