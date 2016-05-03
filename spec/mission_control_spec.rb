require "mission_control"

describe MissionControl do

  it 'initialises with an input' do
    mission_control = MissionControl.new
    mission_control.input.format_robot_data
    expect(mission_control.robot_pairs).to eq([[1,1,"E","RFRFRFRF"],[3, 2, "N", "FRRFLLFFRRFLL"]])
    expect(mission_control.grid_data).to eq(input.grid_data)
  end

  xit 'creates an instance of the class rover for every set of data available' do
    mission_control = MissionControl.new
    mission_control.create_rover([[1,1,"E","RFRFRFRF"],[3, 2, "N", "FRRFLLFFRRFLL"]])
  end

end
































# let(:input) {Input.new}
# let(:mission_control) {MissionControl.new(x, y, orientation, commands)}

# it 'initialises a number of rovers depending on how many pieces of robot data are available' do
#   mission_control = MissionControl.new
#   expect(input).to receive(:format_robot_data).and_return([[1,1,"E","RFRFRFRF"],[3, 2, "N","FRRFLLFFRRFLL"]])
#   expect(mission_control).to receive(:create_rover).and_return([1,1,"E","RFRFRFRF"])
#   rover1 = mission_control.create_rover(1,1,"E","RFRFRFRF")
#   # rover2 = mission_control.create_rover(3,2,"N","FRRFLLFFRRFLL")
#   expect(rover1.x).to eq(1)
#   expect(rover1.y).to eq(1)
#   expect(rover1.orientation).to eq("E")
# end
