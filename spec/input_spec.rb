require "input"

describe Input do

  context '#format_input' do

    before(:each) do
      @input = Input.new
      expect(File).to receive(:open).with('./input.txt','rb').and_return("5 3\n1 1 E\nRFRFRFRF\n\n3 2 N\nFRRFLLFFRRFLL")
    end

    it 'splits the input by line into an array of strings' do
      @input.parse_file
      expect(@input.parsed_input).to eq(["5 3", "1 1 E", "RFRFRFRF", "", "3 2 N", "FRRFLLFFRRFLL"])
    end

    it 'extracts, deletes and formats the grid dimensions from the array' do
      @input.format_grid_data
      expect(@input.grid_dataset).to eq([5,3])
      expect(@input.parsed_input).to eq(["1 1 E", "RFRFRFRF", "", "3 2 N", "FRRFLLFFRRFLL"])
    end

    it 'extracts the coordinates and the commands from the array' do
      @input.extract_robots_data
      expect(@input.robots_data).to eq([["1 1 E", "RFRFRFRF"], ["3 2 N", "FRRFLLFFRRFLL"]])
    end

    it 'format the robot data for consumption by a new robot' do
      @input.format_robots_data
      expect(@input.robot_datasets).to eq([[1,1,"E","RFRFRFRF"],[3, 2, "N","FRRFLLFFRRFLL"]])
    end
  end

  context '#check if coordinate is an integer' do

    before(:each) do
      @input = Input.new
      allow(File).to receive(:open).with('./input.txt','rb').and_return("5 3\nS 1 E\nRFRFRPTFRF\n\n3 2 N\nFRRFLLFFRRFLL")
      @input.format_robots_data
    end

    it 'checks that the coordinate is an integer' do
      expect(@input.format_robots_data).to eq("The robot's axis must be an integer")
    end
  end

  context '#check if coordinate is less than 50' do

    before(:each) do
      @input = Input.new
      allow(File).to receive(:open).with('./input.txt','rb').and_return("5 3\n1 51 E\nRFRFRPTFRF\n\n3 2 N\nFRRFLLFFRRFLL")
      @input.format_robots_data
    end

    it 'checks that the maximum value of the coordinates is 50' do
      expect(@input.format_robots_data).to eq("The axis cannot be bigger than 50")
    end
  end

  context '#check if orientation if NSEW' do

    before(:each) do
      @input = Input.new
      allow(File).to receive(:open).with('./input.txt','rb').and_return("5 3\n1 1 P\nRFRFRPTFRF\n\n3 2 N\nFRRFLLFFRRFLL")
      @input.format_robots_data
    end

    it 'checks that the orientation is N, S, E or W' do
      expect(@input.format_robots_data).to eq("The robot's orientation must be N, S, E or W")
    end
  end

  context '#check if commands are only RLF' do

    before(:each) do
      @input = Input.new
      allow(File).to receive(:open).with('./input.txt','rb').and_return("5 3\n1 1 E\nRFRFRPTFRF\n\n3 2 N\nFRRFLLFFRRFLL")
    end

    it 'checks that the commands are only R, L or F' do
      expect(@input.format_robots_data).to eq("The commands can only be R, L or F")
    end
  end

  context '#check if commands is less than 100 chars' do

    before(:each) do
      @input = Input.new
      allow(File).to receive(:open).with('./input.txt','rb').and_return("5 3\n1 1 E\nRFRFRFRF\n\n3 2 N\nFRRFLLFFRRFLLFRRFLLFFRRFLLFRRFLLFFRRFLLFRRFLLFFRRFLLFRRFLLFFRRFLLFRRFLLFFRRFLLFRRFLLFFRRFLLFRRFLLFFRRFLLFRRFLLFFRRFLLFR")
    end

    it 'checks that the instruction string is shorter than 100 characters' do
      expect(@input.format_robots_data).to eq("Please do not enter more than 100 characters")
    end
  end

end
