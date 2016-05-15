require "robot"
require "grid"

describe Robot do

  let(:grid) {Grid.new([5,3])}

  it 'is initialised with a 0, 0, N position and a command string' do
    robot = Robot.new([0, 0, "N", "RFRFRFRF"],grid)
    expect(robot.x).to eq(0)
    expect(robot.y).to eq(0)
    expect(robot.orientation).to eq("N")
    expect(robot.commands).to eq("RFRFRFRF")
  end

  context '#moves forward' do
    it 'moves up one point on the y-axis when orientation is North' do
      robot = Robot.new([0, 0, "N", "RFRFRFRF"],grid)
      robot.move_forward
      expect(robot.y).to eq(1)
    end

    it 'moves up one point on the x-axis when orientation is East' do
      robot = Robot.new([0, 0, "E", "RFRFRFRF"],grid)
      robot.move_forward
      expect(robot.x).to eq(1)
    end

    it 'moves down one point on the y-axis when orientation is South' do
      robot = Robot.new([0, 1, "S", "RFRFRFRF"],grid)
      robot.move_forward
      expect(robot.y).to eq(0)
    end

    it 'moves down one point on the x-axis when orientation is West' do
      robot = Robot.new([1, 0, "W", "RFRFRFRF"],grid)
      robot.move_forward
      expect(robot.x).to eq(0)
    end
  end

  context '#changes orientation when moving left' do
    it 'moves from North to West' do
      robot = Robot.new([0, 0, "N", "LLFFFLFLFL"],grid)
      robot.turn("L")
      expect(robot.orientation).to eq("W")
    end

    it 'moves from East to North' do
      robot = Robot.new([0,0, "E", "LLFFFLFLFL"],grid)
      robot.turn("L")
      expect(robot.orientation).to eq("N")
    end

    it 'moves from South to East' do
      robot = Robot.new([0,0, "S", "LLFFFLFLFL"],grid)
      robot.turn("L")
      expect(robot.orientation).to eq("E")
    end

    it 'moves from West to South' do
      robot = Robot.new([0,0, "W", "LLFFFLFLFL"],grid)
      robot.turn("L")
      expect(robot.orientation).to eq("S")
    end
  end

  context '#changes orientation when moving right' do
    it 'moves from North to East' do
      robot = Robot.new([0, 0, "N", "RFRFRFRF"],grid)
      robot.turn("R")
      expect(robot.orientation).to eq("E")
    end

    it 'moves from East to South' do
      robot = Robot.new([0, 0, "E", "RFRFRFRF"],grid)
      robot.turn("R")
      expect(robot.orientation).to eq("S")
    end

    it 'moves from South to West' do
      robot = Robot.new([0, 0, "S", "RFRFRFRF"],grid)
      robot.turn("R")
      expect(robot.orientation).to eq("W")
    end

    it 'moves from West to North' do
      robot = Robot.new([0, 0, "W", "RFRFRFRF"],grid)
      robot.turn("R")
      expect(robot.orientation).to eq("N")
    end
  end

  context '#follows commands' do
    it 'is initialised at position 11E with commands RFRFRFRF' do
      robot = Robot.new([1, 1, "E", "RFRFRFRF"],grid)
      expect(robot.move_robot).to eq([1,1,"E", false])
    end

    it 'is initialised at position 32N with commands FRRFLLFFRRFLL' do
      robot = Robot.new([3, 2, "N", "FRRFLLFFRRFLL"],grid)
      expect(robot.move_robot).to eq([3,3,"N", true])

    end
  end

  xcontext '#scents' do
    before(:each) do
      @robot = Robot.new([1,1,"N", "RFRFRFRF"],grid)
    end

    it 'returns true if the grid is scented where the robot is' do
      expect(grid).to receive(:is_scented?).with(1,1,"N").and_return(true)
      expect(@robot.ignore_forward?).to be true
    end

    it 'ignores the Forward command if ignore_forward is true' do
      expect(grid).to receive(:is_scented?).with(1,1,"N").and_return(true)
      expect(grid).to receive(:is_scented?).with(1,1,"E").and_return(false)
      @robot.move_robot
      expect(@robot.x).to eq(1)
      expect(@robot.y).to eq(1)
      expect(@robot.orientation).to eq("N")
    end
  end

  xcontext '#lost robot' do
    it 'returns "LOST" when gone off-grid' do
      @robot = Robot.new([0,3,"W", "LLFFFLFLFL"],grid)
      @robot.move_robot
      @robot.is_lost?
      expect(@robot.status).to eq("LOST")
    end

    it 'returns "SAFE" if still on the grid' do
      @robot = Robot.new([1,1,"E", "RFRFRFRF"],grid)
      @robot.move_robot
      @robot.is_lost?
      expect(@robot.status).to eq("SAFE")
    end

    it 'returns the last position it was at before getting lost' do
      @robot = Robot.new([3,2,"N", "FRRFLLFFRRFLL"],grid)
      @robot.move_robot
      @robot.record_position
      # expect(@robot.last_seen).to eq([3,3,"N"])
    end

    it 'returns the final position when not getting lost' do
      @robot = Robot.new([1,1,"E", "RFRFRFRF"],grid)
      @robot.move_robot
      @robot.record_position
      expect(@robot.status).to eq("SAFE")
      expect(@robot.x).to eq(1)
      expect(@robot.y).to eq(1)
      expect(@robot.orientation).to eq("E")
    end
  end

  xcontext '#move_robot' do
    it 'moves a robot, checks if robot is lost, and return last position' do
      @robot = Robot.new([1,1,"E", "RFRFRFRF"],grid)
      @robot.move_robot
      expect(@robot.status).to eq("SAFE")
      # expect(@robot.final_position).to eq([1,1,"E"])
    end
  end

end
