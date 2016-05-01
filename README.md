# Mars Rover Technical Assessment

**Setup and running the app**

This app was written in Ruby 2.3, and was test-driven using Rspec.

In order to run the app, please run`ruby lib/mission_control.rb` from the parent folder `mars-rover`.

*Please do not include spaces in your input.*

**Testing**

This app was test-driven using Rspec. You will need to use `bundle install` to install the Rspec gem. In order to run the tests, simply run `rspec` from the command line when in the parent folder `mars-rover`.

Due to a lack of time, only the `Rover` class and its methods have been test-driven. The `MissionControl` class was a draft until I realised I had ran out of time. I would like to re-write it by test-driving it.

**Assumptions and design**

This assessment was written in Ruby 2.3. It currently only allows the user to instantiate the rovers one after another, rather than simultaneously. The programme runs with two classes, a `Rover` class and a `MissionControl` class. `MissionControl` receives the user input and instantiate a new rover and gives it a set of commands passed by the user. `Rover` is in charge of moving itself according to the set of coordinates and commands fed to it by `MissionControl`, and returning its position.

**Challenges**

Apart from battling a horrible onset of tonsilitis and a crashing dinosaur of a laptop, this problem was both challenging and rewarding.

As this was my first ever tech test, I adopted the "make it work, make it quick, make it pretty" attitude, although it will become apparent that I haven't quite finished making it pretty and that it needs a few more edge cases.

The main challenges I encountered were to first understand the question, as I am used to working with user stories rather than problems, keeping the design simple and logical, refactoring, and most importantly, time-management, as I struggled on aspects that kept me from implementing other features (notably edge cases).

- I would have liked to refactor the input validation I originally had in place:

```
response_array.each do |line|
  if line.start_with?(*"0".."9") && line.end_with?(*"0".."9")
    @plateau << line
  elsif line.start_with?(*"0".."9") && line.end_with?('N', 'E', 'S', 'W')
    @coordinates << line
  elsif line.start_with?('L', 'l', 'M', 'l', 'R', 'r') && line.end_with?('L', 'l', 'M', 'm', 'R', 'r')
    commands = line.chars
  end
end
```

- With more time, I would have implemented edge cases, notably to make sure the rover does not go beyond the limits of the plateau, or to allow for the dimensions of the plateau to be changed after rovers have been created. At the moment, the dimensions of the plateau do not impact the programme.

- I would have also liked to implement edge cases for user input (returning an error message if the input does not match the correct format or is missing information).

**Refactoring**

- The programme originally ran in one class as I set out to build a working MVP. I then extracted some of the logic to the `MissionControl` class so as to better follow the principles of encapsulation and single responsibility.

- I started out with some long conditionals, which I have then tried to make cleaner or more readable by replacing the array `position` by its three constituting elements `x`, `y` and `direction`:

```
if @position[2] == "N"
  @position[1] += 1
elsif @position[2] == "E"
  @position[0] += 1
elsif @position[2] == "S"
  @position[1] -= 1
elsif @position[2] == "W"
  @position[0] -= 1
end
```

Became

```
if @direction == "N"
  @y += 1
elsif @direction == "E"
  @x += 1
elsif @direction == "S"
  @y -= 1
elsif @direction == "W"
  @x -= 1
end
```

- Although it is possible to refactor the `move_rover` method to :

`char == "L" ? self.move_left : char == "R" ? self.move_right : char == "M" ? self.move : "Rover does not understand"`

the code would be very difficult to read. A more OO solution may be attempted once the programme is complete.

**Future Challenges**

- In the future, this app could be developed and the control of the rovers could be improved, notably by allowing rover commands to be edited. I would also automate the rover movement sequence.

- At the moment, the app doesn't allow for spaces between characters in the commands. This is something that I would look at.

**TL;DR**
- `ruby mission_control.rb` to run the programme
- `rspec` to test the programme
- The programme has some classes
- I struggled but I had fun
- I could spend the rest of my life refactoring
- I could add features to the programme

**Thanks for reading, using and testing!**

## Assessment:
A squad of robotic rovers are to be landed by NASA on a plateau on Mars. This plateau, which is curiously rectangular, must be navigated by the rovers so that their on-board cameras can get a complete view of the surrounding terrain to send back to Earth.

A rover’s position and location is represented by a combination of x and y co-ordinates and a letter representing one of the four cardinal compass points. The plateau is divided up into a grid to simplify navigation. An example position might be 0, 0, N, which means the rover is in the bottom left corner and facing North.

In order to control a rover, NASA sends a simple string of letters. The possible letters are ‘L’, ‘R’ and ‘M’. ‘L’ and ‘R’ makes the rover spin 90 degrees left or right respectively, without moving from its current spot. ‘M’ means move forward one grid point, and maintain the same heading.

Assume that the square directly North from (x, y) is (x, y+1).

**Input:**  
The first line of input is the upper-right coordinates of the plateau, the lower-left coordinates are assumed to be 0,0.

The rest of the input is information pertaining to the rovers that have been deployed. Each rover has two lines of input. The first line gives the rover’s position, and the second line is a series of instructions telling the rover how to explore the plateau.

The position is made up of two integers and a letter separated by spaces, corresponding to the x and y co-ordinates and the rover’s orientation.

Each rover will be finished sequentially, which means that the second rover won’t start to move until the first one has finished moving.

**Output:**  
The output for each rover should be its final co-ordinates and heading.

**Input and Output:**

*Test Input:*

5 5  
1 2 N  
LMLMLMLMM

3 3 E  
MMRMMRMRRM

*Expected Output:*

1 3 N

5 1 E
