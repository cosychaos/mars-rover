require "commands"
require "rover"

describe Commands do

  context '#input' do
    xit 'accepts a line of commands' do
      rover = Rover.new(1, 2, "N")
      rover.input('LMLMLMLMM')
      # expect(rover.position).to eq([1, 3, "N"])
    end
  end

end
