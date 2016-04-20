class Commands

  attr_accessor :position, :commands

  def initialize(command_string)
    # @commands = command_string
  end

  def initialize (commands_class = Commands, str)
    @commands = commands_class.new(str)
  end

end
