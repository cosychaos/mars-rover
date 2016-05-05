# Mars Rover Technical Assessment

**Setup and running the app**

This app was written in Ruby 2.3, and was test-driven using Rspec.

The programme is not currently complete, and as such can only be run manually or via a REPL. Although robots can be moved, lost robots do not yet records their last position on the grid before falling off, and scents have only been tested and written, but not implemented.

**Testing**

This app was test-driven using Rspec. You will need to use `bundle install` to install the Rspec gem. In order to run the tests, simply run `rspec` from the command line when in the parent folder `mars-rover`.

Some tests have been purposedly escaped as the programme is incomplete.

**Assumptions and design**

This assessment was written in Ruby 2.3. It currently only allows the user to instantiate the rovers one after another, rather than simultaneously. The programme runs with four classes:
- The `Input` class takes care of reading, parsing, and formatting an input file.
- The `Mission Control` class operates as a controller to retrieve the grid and robots data, and instantiate instances of both.
- The `Robot` class is tasked with moving the robots, checking whether the robot is lost, and returning the last position of a robot on the grid.
- The `Grid` class is currently used for the robots to calculate their trajectories and check if they are lost. In the future, a grid will be scented and stop robots from going off grid.

**Challenges**

I had originally started this challenge in JavaScript, but eventually decided to continue in Ruby as I am currently more comfortable with the language.

My laptop was dying a slow and very painful death, so I eventually decided to buy a new one and spent a long time setting it up, but thankfully did not run into too many installation problems.

Although writing this programme has so far been an enjoyable challenge, I currently stand defeated by the lost robot who just refuse to return the last position they were at before falling off the grid. Pesky robots!

Pry has become my best friend, and so have print statements, both of which have been my friends for the long and numerous hours I have spent debugging this programme. I have no doubt we shall very soon be re-united.

The programme is currently missing the (arguably) two most important features: lost robots returning their last grid position and ignoring commands if the grid is scented. There's evidence of my attempt, but it's not quite all tied together just yet, and I think I have over-engineered it and got myself a little confused.

**Refactoring and improving**

I forgot to check for maximum values and maximum string length. This will be added ASAP to the `Input` class, with the relevant tests.

I have a slight aversion for mocks and stubs in RSpec, so I'd like to grok those and refactor my tests to make them neater and clearer.

Some methods, such as `mission_control.create_robot`, `robot.fetch_last_seen` and `fetch_final_position` are not particularly clear, nor short enough. I'd like to spend some time improving these to make the codebase more elegant.

**Future Challenges**

- In the future, this app could be developed and the control of the rovers could be improved, notably by allowing rover commands to be edited or added to the existing sets of commands.

**TL;DR**
- `ruby mission_control.rb` to run the programme
- `rspec` to test the programme
- The programme has some classes
- I struggled but I had fun
- I need to finish it
- I could spend the rest of my life refactoring
- I could add features to the programme

**Thanks for reading, using and testing!**

## Martian Robots:
The surface of Mars can be modelled by a rectangular grid around which robots are able to move according to instructions provided from Earth. You are to write a program that determines each sequence of robot positions and reports the final position of the robot. A robot position consists of a grid coordinate (a pair of integers: x-coordinate followed by y-coordinate) and an orientation (N, S, E, W for north, south, east, and west).

A robot instruction is a string of the letters “L”, “R”, and “F” which represent, respectively, the instructions:

● Left : the robot turns left 90 degrees and remains on the current grid point.
● Right : the robot turns right 90 degrees and remains on the current grid point.
● Forward : the robot moves forward one grid point in the direction of the current orientation and maintains the same orientation.

The direction North corresponds to the direction from grid point (x, y) to grid point (x, y+1). There is also a possibility that additional command types may be required in the future and provision should be made for this.

Since the grid is rectangular and bounded (…yes Mars is a strange planet), a robot that moves “off” an edge of the grid is lost forever. However, lost robots leave a robot “scent” that prohibits future robots from dropping off the world at the same grid point. The scent is left at the last grid position the robot occupied before disappearing over the edge. An instruction to move “off” the world from a grid point from which a robot has been previously lost is simply ignored by the current robot.

**Input:**  
The first line of input is the upper-right coordinates of the rectangular world, the lower-left coordinates are assumed to be 0, 0.

The remaining input consists of a sequence of robot positions and instructions (two lines per robot). A position consists of two integers specifying the initial coordinates of the robot and an orientation (N, S, E, W), all separated by whitespace on one line. A robot instruction is a string of the letters “L”, “R”, and “F” on one line.

Each robot is processed sequentially, i.e., finishes executing the robot instructions before the next robot begins execution.

The maximum value for any coordinate is 50.

All instruction strings will be less than 100 characters in length.

**Output:**  
For each robot position/instruction in the input, the output should indicate the final grid position and orientation of the robot. If a robot falls off the edge of the grid the word “LOST” should be printed after the position and orientation.

**Input and Output:**

*Sample Input:*

```
5 3
1 1 E
RFRFRFRF

3 2 N
FRRFLLFFRRFLL

0 3 W
LLFFFLFLFL
```

*Expected Output:*

```
1 1 E

3 3 N LOST

2 3 S
```
