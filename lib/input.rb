class Input

  attr_accessor  :robot_data, :robots_data, :robot_datasets, :grid_dataset, :grid_data, :parsed_input, :extract_grid, :x_axis, :y_axis

  MAX_VALUE = 50
  MAX_CHARS = 100

  def parse_file
    @contents = File.open('./input.txt', 'rb') { |file| file.read }
    @parsed_input = @contents.split("\n")
  end

  def extract_grid_data
    parse_file
    @grid_data = Array.new << @parsed_input.shift
  end

  def format_grid_data
    extract_grid_data
    @grid_data.each do |coordinate|
      split_coordinate = coordinate.split(" ")
       @grid_dataset = Array.new << split_coordinate[0].to_i << split_coordinate[1].to_i
    end
  end

  def extract_robots_data
    format_grid_data
    @robots_data = @parsed_input.reject(&:empty?).each_slice(2).to_a
  end

  def format_robots_data
    robot_data = []
    @robot_datasets = []
    extract_robots_data
    @robots_data.each do |dataset|
      split_dataset = dataset[0].split(" ")
      robot_data << split_dataset[0].to_i << split_dataset[1].to_i << split_dataset[2] << dataset[1]
      @robot_datasets = robot_data.each_slice(4).to_a
    end
  end

  def check_coords
    @robots_data.each do |dataset|
      dataset[0].split(" ")
      x_axis = dataset[0][0]
      y_axis = dataset[0][2]

      x_axis = x_axis.to_i if x_axis.match(/\d/)
      y_axis = y_axis.to_i if y_axis.match(/\d/)
      orientation = dataset[0][4]

        if !x_axis.is_a?(Integer) || !y_axis.is_a?(Integer)
          return "The robot's axis must be an integer"
        elsif orientation != "N" && orientation != "S" && orientation != "E" && orientation != "W"
          return "The robot's orientation must be N, S, E or W"
        end
    end
  end

  def check_cmds
    @robots_data.each do |dataset|
      dataset[1].each_char do |char|
        if char != "R" || char != "L" || char != "F"
          return "The commands can only be R, L or F"
        end
      end
    end
  end

  def check_value
    @robots_data.each do |dataset|
      dataset = dataset[0].split(" ")
      x_axis = dataset[0].to_i if dataset[0].match(/\d+/)
      y_axis = dataset[1].to_i if dataset[1].match(/\d+/)
      if x_axis > MAX_VALUE || y_axis > MAX_VALUE
        return "The axis cannot be bigger than 50"
      end
    end
  end

  def check_length
    @robots_data.each do |dataset|
      if dataset[1].length > MAX_CHARS
        return "Please do not enter more than 100 commands"
      end
    end
  end

  # def check_input
  #   check_coords
  #   check_cmds
  #   check_value
  #   check_length
  # end

  def fetch_all_data
    format_grid_data
    format_robots_data
  end

end
