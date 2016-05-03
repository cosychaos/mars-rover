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

  it 'create a robot with for each robot dataset available' do
    @mission_control.create_robot
    expect(@mission_control.deployed_robots).to eq([[1, 1, "E", "RFRFRFRF"], [3, 2, "N", "FRRFLLFFRRFLL"], [0, 3, "W", "LLFFFLFLFL"]])
  end

  it 'creates a grid with the grid dataset available' do
    @mission_control.create_grid
    expect(@mission_control.grid.x).to eq(5)
    expect(@mission_control.grid.y).to eq(3)
  end

end
































# let(:input) {Input.new}
# let(:mission_control) {MissionControl.new(x, y, orientation, commands)}

# it 'initialises a number of robots depending on how many pieces of robot data are available' do
#   mission_control = MissionControl.new
#   expect(input).to receive(:format_robot_data).and_return([[1,1,"E","RFRFRFRF"],[3, 2, "N","FRRFLLFFRRFLL"]])
#   expect(mission_control).to receive(:create_robot).and_return([1,1,"E","RFRFRFRF"])
#   robot1 = mission_control.create_robot(1,1,"E","RFRFRFRF")
#   # robot2 = mission_control.create_robot(3,2,"N","FRRFLLFFRRFLL")
#   expect(robot1.x).to eq(1)
#   expect(robot1.y).to eq(1)
#   expect(robot1.orientation).to eq("E")
# end
