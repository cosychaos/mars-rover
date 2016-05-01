require "commands"

describe Commands do

context 'verifies the value of the grid dimensions' do
  it 'raises an error if x is larger than the maximum value' do
    commands = Commands.new(51, 2, "N", "RFRFRFRF")
    expect{ commands.check_value }.to raise_error("The grid dimensions are too large.")
  end

  it 'raises an error if y is larger than the maximum value' do
    commands = Commands.new(3, 62, "N", "RFRFRFRF")
    expect{ commands.check_value }.to raise_error("The grid dimensions are too large.")
  end
end

context 'verifies the length of the command string' do
  it 'raises an error if the command string is longer than 100 characters' do
    commands = Commands.new(3, 4, "N", "LMRLMRMRLMRLMRMMRLMRLMRMRLMRLMRMMRLMRLMRMRLMRLMRMMRLMRLMRMRLMRLMRMMRLMRLMRMRLMRLMRMMRLMRLMRMRLMRLMRMMRLMRLMRMRLMRLMRMMRLMRLMRMRLMRLMRMMRLMRLMRMRLMRLMRMMRLMRLMRMRLMRLMRMMRLMRLMRMRLMRLMRMMRLMRLMRMRLMRLMRMMRLMRLMRMRLMRLMRMMR")
    expect{ commands.check_length }.to raise_error("The command string is too long.")
  end
end

end
