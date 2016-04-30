require "rover"

describe Rover do

  it 'initialises a rover with a 0, 0, N position' do
    rover = Rover.new(0, 0, "N")
    expect(rover.x).to eq(0)
    expect(rover.y).to eq(0)
    expect(rover.direction).to eq("N")
  end

  context '#moves forward' do
    it 'moves up one point on the y-axis when direction is North' do
      rover = Rover.new(0, 0, "N")
      rover.move
      expect(rover.y).to eq(1)
    end

    it 'moves up one point on the x-axis when direction is East' do
      rover = Rover.new(0, 0, "E")
      rover.move
      expect(rover.x).to eq(1)
    end

    it 'moves down one point on the y-axis when direction is South' do
      rover = Rover.new(0, 1, "S")
      rover.move
      expect(rover.y).to eq(0)
    end

    it 'moves down one point on the x-axis when direction is West' do
      rover = Rover.new(1, 0, "W")
      rover.move
      expect(rover.x).to eq(0)
    end
  end

  context '#changes orientation when moving left' do
    it 'moves from North to West' do
      rover = Rover.new(0, 0, "N")
      rover.move_left
      expect(rover.direction).to eq("W")
    end

    it 'moves from East to North' do
      rover = Rover.new(0,0, "E")
      rover.move_left
      expect(rover.direction).to eq("N")
    end

    it 'moves from South to East' do
      rover = Rover.new(0,0, "S")
      rover.move_left
      expect(rover.direction).to eq("E")
    end

    it 'moves from West to South' do
      rover = Rover.new(0,0, "W")
      rover.move_left
      expect(rover.direction).to eq("S")
    end
  end

  context '#changes orientation when moving right' do
    it 'moves from North to East' do
      rover = Rover.new(0, 0, "N")
      rover.move_right
      expect(rover.direction).to eq("E")
    end

    it 'moves from East to South' do
      rover = Rover.new(0, 0, "E")
      rover.move_right
      expect(rover.direction).to eq("S")
    end

    it 'moves from South to West' do
      rover = Rover.new(0, 0, "S")
      rover.move_right
      expect(rover.direction).to eq("W")
    end

    it 'moves from West to North' do
      rover = Rover.new(0, 0, "W")
      rover.move_right
      expect(rover.direction).to eq("N")
    end
  end

  it 'follows commands' do
    rover = Rover.new(1, 2, "N")
    rover.move_rover(["L", "M", "L", "M", "L", "M", "L", "M", "M"])
    expect(rover.x).to eq(1)
    expect(rover.y).to eq(3)
    expect(rover.direction).to eq("N")
  end
end
