class Commands

attr_accessor :x, :y, :orientation, :commands

  MAX_VALUE = 50
  MAX_CHARS = 100

  def initialize(x, y, orientation, command_string)
    @x = x
    @y = y
    @orientation = orientation
    @commands = command_string
  end

  def check_value
    if @x >= MAX_VALUE or @y >= MAX_VALUE
      raise ArgumentError.new("The grid dimensions are too large.")
    end
  end

  def check_length
    if @commands.length >= MAX_CHARS
      raise ArgumentError.new("The command string is too long.")
    end
  end

end
