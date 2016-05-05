require "mission_control"

describe MissionControl do

  before(:each) do
    @mission_control = MissionControl.new
    @mission_control.fetch_datasets
  end

  context '#retrieves data' do
    it 'retrieves the robot datasets' do
      expect(@mission_control.robot_datasets).to eq([[1, 1, "E", "RFRFRFRF"], [3, 2, "N", "FRRFLLFFRRFLL"], [0, 3, "W", "LLFFFLFLFL"]])
    end

    it 'retrieves the grid dataset' do
      expect(@mission_control.grid_dataset).to eq([5,3])
    end
  end

  context '#instantiates elements' do
    it 'instantiate a grid with the grid dataset available' do
      @mission_control.create_grid
      expect(@mission_control.grid.x).to eq(5)
      expect(@mission_control.grid.y).to eq(3)
    end

    it 'instantiate a robot for each robot dataset available' do
      @mission_control.create_robot
      expect(@mission_control.deployed_robots.count).to be(3)
    end
  end

  xcontext '#moves robots' do
    it 'moves a series of robots' do
      @mission_control.create_robot
      @mission_control.move_robots
      expect(@mission_control.deployed_robots[0].final_position).to eq([1,1,'E'])
    end
  end

end
