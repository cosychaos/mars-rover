
class Rover

def initialize(position, commands)
  @position = position
  @commands = commands
end

# TODO - refactor the logic
  def move_left
    if @position[2] == "N"
      @position.delete_at(2)
      @position.insert(2, "W")
    elsif @position[2] == "W"
      @position.delete_at(2)
      @position.insert(2, "S")
    elsif @position[2] == "S"
      @position.delete_at(2)
      @position.insert(2, "E")
    elsif @position[2] == "E"
      @position.delete_at(2)
      @position.insert(2, "N")
    end
  end

# TODO - refactor the logic
  def move_right
    if @position[2] == "N"
      @position.delete_at(2)
      @position.insert(2, "E")
    elsif @position[2] == "E"
      @position.delete_at(2)
      @position.insert(2, "S")
    elsif @position[2] == "S"
      @position.delete_at(2)
      @position.insert(2, "W")
    elsif @position[2] == "W"
      @position.delete_at(2)
      @position.insert(2, "N")
    end
  end

# TODO - refactor the logic
  def move
    if @position[2] == "N"
      @position[1] += 1
    elsif @position[2] == "E"
      @position[0] += 1
    elsif @position[2] == "S"
      @position[1] -= 1
    elsif @position[2] == "W"
      @position[0] -= 1
    end
  end

# TODO - Refactor the logic
  def move_rover
    @commands.each do |char|
      if char == "l" || char == "L"
        self.move_left
      elsif char == "r" || char == "R"
        self.move_right
      elsif char == "m" || char == "M"
        self.move
      else
        "Rover does not understand"
      end
    end
  end

  def final_position
    array = @position.flatten.join(" ")
    print "Rover is at position: " + array + "  \n"
  end

end
