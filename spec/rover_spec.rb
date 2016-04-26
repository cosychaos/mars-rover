require "rover"

describe Rover do

  it 'initialises a rover with a 0, 0, N position' do
    rover = Rover.new(0, 0, "N")
    expect(rover.x).to eq(0)
    expect(rover.y).to eq(0)
    expect(rover.direction).to eq("N")
  end

context '#moves forward' do
  it 'moves on the x and y axis depending on the orientation' do
    rover = Rover.new(0, 0, "N")
    rover.move
    expect(rover.y).to eq(1)
  end
end

context '#changes orientation' do
  it 'moves left of its current cardinal point' do
    rover = Rover.new(0, 0, "N")
    rover.move_left
    expect(rover.direction).to eq("W")
  end

  it 'moves right of its current cardinal point' do
    rover = Rover.new(0, 0, "N")
    rover.move_right
    expect(rover.direction).to eq("E")
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
