require "commands"

describe Commands do

  # before(:each) do
  #   commands = Commands.new
  # end

  it 'reads an input file' do
    commands = Commands.new
    expect(commands.read_file).to eq("5 5\n1 2 N\nLMLMLMLMM\n\n3 3 E\nMMRMMRMRRM\n")
  end

  it 'splits the input into array of strings at return line' do
    commands = Commands.new
    commands.read_file
    expect(commands.split_input).to eq(["5 5", "1 2 N", "LMLMLMLMM", "", "3 3 E", "MMRMMRMRRM"])
  end

context 'extracts data from the input' do

  it 'extracts the grid dimensions' do
    commands = Commands.new
    commands.read_file
    commands.split_input
    commands.extract_grid
    expect(commands.grid).to eq(["5 5"])
  end

  it 'extracts the coordinates' do
    commands = Commands.new
    commands.read_file
    commands.split_input
    commands.extract_coordinates
    expect(commands.coordinates).to eq(["1 2 N", "3 3 E"])
  end

  it 'extracts the commands' do
    commands = Commands.new
    commands.read_file
    commands.split_input
    commands.extract_commands
    expect(commands.commands).to eq(["LMLMLMLMM", "MMRMMRMRRM"])
  end
end

end
