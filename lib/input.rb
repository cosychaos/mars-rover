class Input

  attr_accessor  :robot_data, :robots_data, :robot_pairs, :formatted_grid_data, :grid_data, :parsed_input, :extract_grid

  def read_file
    @contents = File.open('./input.txt', 'rb') { |file| file.read }
  end

    def split_contents
    @parsed_input = @contents.split("\n")
  end

  def parse_file
    self.read_file
    self.split_contents
  end

  def extract_grid_data
    self.parse_file
    @grid_data = Array.new << @parsed_input.shift
  end

  def format_grid_data
    self.extract_grid_data
    @grid_data.each do |coordinate|
      split_coordinate = coordinate.split(" ")
       @formatted_grid_data = Array.new << split_coordinate[0].to_i << split_coordinate[1].to_i
    end
  end

  def extract_robots_data
    self.format_grid_data
    @robots_data = @parsed_input.reject(&:empty?).each_slice(2).to_a
  end

  def format_robot_data
    robot_data = []
    @robot_pairs = []
    self.extract_robots_data
    @robots_data.each do |pair|
      split_pair = pair[0].split(" ")
      robot_data << split_pair[0].to_i << split_pair[1].to_i << split_pair[2] << pair[1]
      @robot_pairs = robot_data.each_slice(4).to_a
    end
  end

end
