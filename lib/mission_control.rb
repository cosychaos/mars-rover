require_relative 'rover'

class MissionControl

  def read_plateau
    gets.chomp
  end

  def read_position
    position = []
    elem = gets.chomp.upcase
    position << elem.chars[0].to_i
    position << elem.chars[1].to_i
    position << elem.chars[2]

    return position
  end

  def read_commands
    gets.chomp.upcase.chars
  end

  def create_rover
    pos = self.read_position
    Rover.new(pos[0], pos[1], pos[2])
  end

end

mission_control = MissionControl.new

print "Enter position "
rover1 = mission_control.create_rover
print "Enter commands "
commands = mission_control.read_commands
rover1.move_rover(commands)
puts rover1.final_position

print "Enter position "
rover2 = mission_control.create_rover
print "Enter commands "
commands = mission_control.read_commands
rover2.move_rover(commands)
puts rover2.final_position
