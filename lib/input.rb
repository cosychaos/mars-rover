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

      if !split_dataset[0].match(/\d+/)
        return "The robot's axis must be an integer"
      elsif split_dataset[0].to_i > MAX_VALUE
        return "The axis cannot be bigger than 50"
      elsif split_dataset[0].match(/\d+/) && split_dataset[0].to_i < MAX_VALUE
        robot_data << split_dataset[0].to_i
      end

      if !split_dataset[1].match(/\d+/)
        return "The robot's axis must be an integer"
      elsif split_dataset[1].to_i > MAX_VALUE
        return "The axis cannot be bigger than 50"
      elsif split_dataset[1].match(/\d+/) && split_dataset[1].to_i < MAX_VALUE
        robot_data << split_dataset[1].to_i
      end

      if split_dataset[2] != "N" && split_dataset[2] != "S" && split_dataset[2] != "E" && split_dataset[2] != "W"
        return "The robot's orientation must be N, S, E or W"
      else
        robot_data << split_dataset[2]
      end

      if dataset[1].length < MAX_CHARS
        dataset[1].each_char do |char|
          if char != "R" && char != "L" && char != "F"
            return "The commands can only be R, L or F"
          end
        end
        robot_data << dataset[1]
      elsif dataset[1].length > MAX_CHARS
         return "Please do not enter more than 100 characters"
      end

      @robot_datasets = robot_data.each_slice(4).to_a
    end
  end

  def fetch_all_data
    format_grid_data
    format_robots_data
  end

end
