require "rover"

describe Rover do

  it 'initialises a rover with a 0, 0, N position' do
    rover = Rover.new(0, 0, "N")
    expect(rover.position).to eq([0, 0, "N"])
  end

context '#x_axis' do
  it 'moves up one point on the x-axis' do
    rover = Rover.new(0, 0, "N")
    rover.move_up_x_axis
    expect(rover.position).to eq([1, 0, "N"])
  end

  it 'moves down one point of the x-axis' do
    rover = Rover.new(2, 0, "N")
    rover.move_down_x_axis
    expect(rover.position).to eq([1, 0, "N"])
  end
end

context '#y_axis' do
  it 'moves up one point on the y-axis' do
    rover = Rover.new(0, 0, "N")
    rover.move_up_y_axis
    expect(rover.position).to eq([0, 1, "N"])
  end

  it 'moves down one point on the y-axis' do
    rover = Rover.new(0, 2, "N")
    rover.move_down_y_axis
    expect(rover.position).to eq([0, 1, "N"])
  end
end

context '#movement' do
  it 'moves on the x and y axis depending on the orientation' do
    rover = Rover.new(0, 0, "N")
    rover.move
    expect(rover.position).to eq([0, 1, "N"])
  end
end

context '#changes orientation' do
  it 'moves left of it\'s current cardinal point' do
    rover = Rover.new(0, 0, "N")
    rover.move_left
    expect(rover.position).to eq([0, 0, "W"])
  end

  it 'moves right of it\'s current cardinal point' do
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
end

end
