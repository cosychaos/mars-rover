require "rover"
require "grid"

describe Rover do

  let(:grid) {Grid.new(5,5)}

  it 'is initialised with a 0, 0, N position' do
    rover = Rover.new(0, 0, "N")
    expect(rover.x).to eq(0)
    expect(rover.y).to eq(0)
    expect(rover.orientation).to eq("N")
  end

  context '#moves forward' do
    it 'moves up one point on the y-axis when orientation is North' do
      rover = Rover.new(0, 0, "N")
      rover.move_forward(grid)
      expect(rover.y).to eq(1)
    end

    it 'moves up one point on the x-axis when orientation is East' do
      rover = Rover.new(0, 0, "E")
      rover.move_forward(grid)
      expect(rover.x).to eq(1)
    end

    it 'moves down one point on the y-axis when orientation is South' do
      rover = Rover.new(0, 1, "S")
      rover.move_forward(grid)
      expect(rover.y).to eq(0)
    end

    it 'moves down one point on the x-axis when orientation is West' do
      rover = Rover.new(1, 0, "W")
      rover.move_forward(grid)
      expect(rover.x).to eq(0)
    end
  end

  context '#changes orientation when moving left' do
    it 'moves from North to West' do
      rover = Rover.new(0, 0, "N")
      rover.turn("L")
      expect(rover.orientation).to eq("W")
    end

    it 'moves from East to North' do
      rover = Rover.new(0,0, "E")
      rover.turn("L")
      expect(rover.orientation).to eq("N")
    end

    it 'moves from South to East' do
      rover = Rover.new(0,0, "S")
      rover.turn("L")
      expect(rover.orientation).to eq("E")
    end

    it 'moves from West to South' do
      rover = Rover.new(0,0, "W")
      rover.turn("L")
      expect(rover.orientation).to eq("S")
    end
  end

  context '#changes orientation when moving right' do
    it 'moves from North to East' do
      rover = Rover.new(0, 0, "N")
      rover.turn("R")
      expect(rover.orientation).to eq("E")
    end

    it 'moves from East to South' do
      rover = Rover.new(0, 0, "E")
      rover.turn("R")
      expect(rover.orientation).to eq("S")
    end

    it 'moves from South to West' do
      rover = Rover.new(0, 0, "S")
      rover.turn("R")
      expect(rover.orientation).to eq("W")
    end

    it 'moves from West to North' do
      rover = Rover.new(0, 0, "W")
      rover.turn("R")
      expect(rover.orientation).to eq("N")
    end
  end

  context '#follows commands' do
    it 'is initialised at position 12N with commands LMLMLMLMM' do
      rover = Rover.new(1, 2, "N")
      rover.move_rover(["L", "F", "L", "F", "L", "F", "L", "F", "F"], grid)
      expect(rover.x).to eq(1)
      expect(rover.y).to eq(3)
      expect(rover.orientation).to eq("N")
    end

    it 'is initialised at position 33E with commands MMRMMRMRRM' do
      rover = Rover.new(3, 3, "E")
      rover.move_rover(["F", "F", "R", "F", "F", "R", "F", "R", "R", "F"], grid)
      expect(rover.x).to eq(5)
      expect(rover.y).to eq(1)
      expect(rover.orientation).to eq("E")
    end
  end

  context '#scents' do
    it 'returns true if the grid is scented where the rover is' do
      rover = Rover.new(1,1,"N")
      expect(grid).to receive(:is_scented?).with(1,1,"N").and_return(true)
      expect(rover.ignore_forward?(grid)).to be true
    end

    it 'ignores the Forward command if ignore_forward is true' do
      rover = Rover.new(1,1,"N")
      expect(grid).to receive(:is_scented?).with(1,1,"N").and_return(true)
      expect(grid).to receive(:is_scented?).with(1,1,"E").and_return(false)
      rover.move_rover(["F","R","F"], grid)
      expect(rover.x).to eq(2)
      expect(rover.y).to eq(1)
      expect(rover.orientation).to eq("E")
    end
  end

end
