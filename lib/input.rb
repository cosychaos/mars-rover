class Input

  attr_accessor  :robot_data, :robots_data, :robot_datasets, :grid_dataset, :grid_data, :parsed_input, :extract_grid

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
       @grid_dataset = Array.new << split_coordinate[0].to_i << split_coordinate[1].to_i
    end
  end

  def extract_robots_data
    self.format_grid_data
    @robots_data = @parsed_input.reject(&:empty?).each_slice(2).to_a
  end

  def format_robot_data
    robot_data = []
    @robot_datasets = []
    self.extract_robots_data
    @robots_data.each do |dataset|
      split_dataset = dataset[0].split(" ")
      robot_data << split_dataset[0].to_i << split_dataset[1].to_i << split_dataset[2] << dataset[1]
      @robot_datasets = robot_data.each_slice(4).to_a
    end
  end

  def check_coords
    input = @robots_data
    input.each do |dataset|
      dataset[0].split(" ")
      x_axis = dataset[0][0]
      y_axis = dataset[0][2]

      p x_axis = x_axis.to_i if x_axis.match(/\d/)
      p y_axis = y_axis.to_i if y_axis.match(/\d/)

      orientation = dataset[0][4]
        if !x_axis.is_a?(Integer) || !y_axis.is_a?(Integer)
          return "The robot's axis must be an integer"
        elsif orientation != "N" && orientation != "S" && orientation != "E" && orientation != "W"
          return "The robots orientation must be N, S, E or W"
        end
    end

  end

  def fetch_all_data
    # self.check_input
    self.format_grid_data
    self.format_robot_data
  end

end

# 2 integers (max 50) and NSEW (all separated by whitespace)
# - if more than 50, raise error
# - if no space, raise error (use regex?)
# - if not NSEW, raise error
# - if doesn't start with number, not correct
#
# LRF (max 100 chars)
# - if more than 100 chars, raise error
# - if not LRF, raise error
# - if includes numbers, not correct
