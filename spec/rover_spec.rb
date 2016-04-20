require "rover"

describe Rover do

  it 'initialises a rover with a 0, 0, N position' do
    rover = Rover.new(0, 0, "N")
    expect(rover.position).to eq([0, 0, "N"])
  end

context '#movement' do
  it 'moves on the x and y axis depending on the orientation' do
    rover = Rover.new(0, 0, "N")
    rover.move
    expect(rover.position).to eq([0, 1, "N"])
  end
end

context '#changes orientation' do
  it 'moves left of its current cardinal point' do
    rover = Rover.new(0, 0, "N")
    rover.move_left
    expect(rover.position).to eq([0, 0, "W"])
  end

  it 'moves right of its current cardinal point' do
    rover = Rover.new(0, 0, "N")
    rover.move_right
    expect(rover.position).to eq([0, 0, "E"])
  end
end

context '#input' do
  it 'accepts a line of commands' do
    rover = Rover.new(1, 2, "N")
    rover.input('LMLMLMLMM')
    expect(rover.position).to eq([1, 3, "N"])
  end

  it 'accepts a second line of commands' do
    rover = Rover.new(3, 3, "E")
    rover.input('MMRMMRMRRM')
    expect(rover.position).to eq([5, 1, "E"])
  end
end

end
