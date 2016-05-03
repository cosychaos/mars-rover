require "rover"
require "grid"

describe Rover do

  let(:grid) {Grid.new([5,3])}

  it 'is initialised with a 0, 0, N position and a command string' do
    rover = Rover.new([0, 0, "N", "RFRFRFRF"])
    expect(rover.x).to eq(0)
    expect(rover.y).to eq(0)
    expect(rover.orientation).to eq("N")
    expect(rover.commands).to eq("RFRFRFRF")
  end

  context '#moves forward' do
    it 'moves up one point on the y-axis when orientation is North' do
      rover = Rover.new([0, 0, "N", "RFRFRFRF"])
      rover.move_forward(grid)
      expect(rover.y).to eq(1)
    end

    it 'moves up one point on the x-axis when orientation is East' do
      rover = Rover.new([0, 0, "E", "RFRFRFRF"])
      rover.move_forward(grid)
      expect(rover.x).to eq(1)
    end

    it 'moves down one point on the y-axis when orientation is South' do
      rover = Rover.new([0, 1, "S", "RFRFRFRF"])
      rover.move_forward(grid)
      expect(rover.y).to eq(0)
    end

    it 'moves down one point on the x-axis when orientation is West' do
      rover = Rover.new([1, 0, "W", "RFRFRFRF"])
      rover.move_forward(grid)
      expect(rover.x).to eq(0)
    end
  end

  context '#changes orientation when moving left' do
    it 'moves from North to West' do
      rover = Rover.new([0, 0, "N", "LLFFFLFLFL"])
      rover.turn("L")
      expect(rover.orientation).to eq("W")
    end

    it 'moves from East to North' do
      rover = Rover.new([0,0, "E", "LLFFFLFLFL"])
      rover.turn("L")
      expect(rover.orientation).to eq("N")
    end

    it 'moves from South to East' do
      rover = Rover.new([0,0, "S", "LLFFFLFLFL"])
      rover.turn("L")
      expect(rover.orientation).to eq("E")
    end

    it 'moves from West to South' do
      rover = Rover.new([0,0, "W", "LLFFFLFLFL"])
      rover.turn("L")
      expect(rover.orientation).to eq("S")
    end
  end

  context '#changes orientation when moving right' do
    it 'moves from North to East' do
      rover = Rover.new([0, 0, "N", "RFRFRFRF"])
      rover.turn("R")
      expect(rover.orientation).to eq("E")
    end

    it 'moves from East to South' do
      rover = Rover.new([0, 0, "E", "RFRFRFRF"])
      rover.turn("R")
      expect(rover.orientation).to eq("S")
    end

    it 'moves from South to West' do
      rover = Rover.new([0, 0, "S", "RFRFRFRF"])
      rover.turn("R")
      expect(rover.orientation).to eq("W")
    end

    it 'moves from West to North' do
      rover = Rover.new([0, 0, "W", "RFRFRFRF"])
      rover.turn("R")
      expect(rover.orientation).to eq("N")
    end
  end

  context '#follows commands' do
    it 'is initialised at position 11E with commands RFRFRFRF' do
      rover = Rover.new([1, 1, "E", "RFRFRFRF"])
      rover.move_rover(["R","F","R","F","R","F","R","F"], grid)
      expect(rover.x).to eq(1)
      expect(rover.y).to eq(1)
      expect(rover.orientation).to eq("E")
    end

    it 'is initialised at position 33E with commands MMRMMRMRRM' do
      rover = Rover.new([3, 2, "N", "FRRFLLFFRRFLL"])
      rover.move_rover(["F","R","R","F","L","L","F","F","R","R","F","L","L"], grid)
      expect(rover.x).to eq(3)
      expect(rover.y).to eq(3)
      expect(rover.orientation).to eq("N")
    end
  end

  context '#scents' do
    it 'returns true if the grid is scented where the rover is' do
      rover = Rover.new([1,1,"N", "RFRFRFRF"])
      expect(grid).to receive(:is_scented?).with(1,1,"N").and_return(true)
      expect(rover.ignore_forward?(grid)).to be true
    end

    it 'ignores the Forward command if ignore_forward is true' do
      rover = Rover.new([1,1,"N", "RFRFRFRF"])
      expect(grid).to receive(:is_scented?).with(1,1,"N").and_return(true)
      expect(grid).to receive(:is_scented?).with(1,1,"E").and_return(false)
      rover.move_rover(["F","R","F"], grid)
      expect(rover.x).to eq(2)
      expect(rover.y).to eq(1)
      expect(rover.orientation).to eq("E")
    end
  end

end
