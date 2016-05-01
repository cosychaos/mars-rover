class Input

  attr_accessor :contents, :input, :grid, :coordinates, :commands

  def initialize
    @grid = []
    @coordinates = []
    @commands = []
  end

  def read_file
    @contents = File.open('./input.txt', 'rb') { |file| file.read }
  end

  def split_input
    @input = @contents.split("\n")
  end

  def extract_grid
    @input.each do |line|
      if line.start_with?(*"0".."9") && line.end_with?(*"0".."9")
        @grid << line
      else
        "Incorrect input"
      end
    end
  end

  def extract_coordinates
    @input.each do |line|
      if line.start_with?(*"0".."9") && line.end_with?('N', 'E', 'S', 'W')
        @coordinates << line
      else
        "Incorrect input"
      end
    end
  end

  def extract_commands
    @input.each do |line|
      if line.start_with?('L', 'l', 'F', 'f', 'l', 'R', 'r') && line.end_with?('L', 'l', 'F', 'f', 'R', 'r')
        @commands << line
      else
        "Incorrect input"
      end
    end
  end

end
