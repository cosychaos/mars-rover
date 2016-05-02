require "input"

describe Input do

  before(:each) do
    @input = Input.new
    @input.read_file
  end

  it 'reads an input file' do
    expect(@input.read_file).to eq("5 3\n1 1 E\nRFRFRFRF\n\n3 2 N\nFRRFLLFFRRFLL\n\n0 3 W\nLLFFFLFLFL\n")
  end

  it 'splits the input into array of strings at return line' do
    expect(@input.split_input).to eq(["5 3", "1 1 E", "RFRFRFRF", "", "3 2 N", "FRRFLLFFRRFLL", "", "0 3 W", "LLFFFLFLFL"])
  end

context 'extracts data from the input' do
  before(:each) do
    @input = Input.new
    @input.read_file
    @input.split_input
  end

  it 'extracts the grid dimensions' do
    @input.extract_grid
    expect(@input.grid).to eq(["5 3"])
  end

  it 'extracts the coordinates' do
    @input.extract_coordinates
    expect(@input.coordinates).to eq(["1 1 E", "3 2 N", "0 3 W"])
  end

  it 'extracts the input' do
    @input.extract_commands
    expect(@input.commands).to eq(["RFRFRFRF", "FRRFLLFFRRFLL", "LLFFFLFLFL"])
  end
end

end
