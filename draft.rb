def format_robots_data
  robot_data = []
  @robot_datasets = []
  extract_robots_data
  @robots_data.each do |dataset|
    split_dataset = dataset[0].split(" ")

    split_dataset[0].match(/\d+/) ? position0 = split_dataset[0].to_i : "The robot's axis must be an integer"
    position0 <= MAX_VALUE ? robot_data << position0 : "The axis cannot be bigger than 50"
    # if position0 < MAX_VALUE
    #   robot_data << position0
    # else
    #   "The axis cannot be bigger than 50"
    # end
    p robot_data

    # split_dataset[1].match(/\d+/) ? position1 = split_dataset[1].to_i : "The robot's axis must be an integer"
    # position1 <= MAX_VALUE ? robot_data << position1 : "The axis cannot be bigger than 50"
    #
    # orientation = split_dataset[2]
    # if orientation != "N" && orientation != "S" && orientation != "E" && orientation != "W"
    #   return "The robot's orientation must be N, S, E or W"
    # else
    #   robot_data << orientation
    # end
    # robot_data << dataset[1]
    # @robot_datasets = robot_data.each_slice(4).to_a
  end
  @robot_datasets
end




  #   split_dataset = dataset[0].split(" ")
  #   split_dataset[0].match(/\d+/) ? position0 = split_dataset[0].to_i : "The robot's axis must be an integer"
  #   position0 < 50 ? robot_data << position0 : "The axis cannot be bigger than 50"
  #   split_dataset[1].match(/\d+/) ? position1 = split_dataset[1].to_i : "The robot's axis must be an integer"
  #   position1 < 50 ? robot_data << position1 : "The axis cannot be bigger than 50"

  #   orientation = split_dataset[2]
  #   if orientation != "N" && orientation != "S" && orientation != "E" && orientation != "W"
  #     return "The robot's orientation must be N, S, E or W"
  #   else
  #     robot_data << orientation
  #   end
  #   robot_data << dataset[1]
  #   @robot_datasets = robot_data.each_slice(4).to_a
  # end

        # robot_data << split_dataset[0].to_i if split_dataset[0].match(/\d+/) || split_dataset[0].to_i < MAX_VALUE
        # robot_data << split_dataset[1].to_i if split_dataset[1].match(/\d+/) || split_dataset[1].to_i < MAX_VALUE

  # def check_coords
  #   # Change to datasets because already formatted there
  #   @robots_data.each do |dataset|
  #     dataset[0].split(" ")
  #     x_axis = dataset[0][0]
  #     y_axis = dataset[0][2]
  #
  #     x_axis = x_axis.to_i if x_axis.match(/\d/)
  #     y_axis = y_axis.to_i if y_axis.match(/\d/)
  #     orientation = dataset[0][4]
  #
  #       if !x_axis.is_a?(Integer) || !y_axis.is_a?(Integer)
  #         return "The robot's axis must be an integer"
  #       elsif orientation != "N" && orientation != "S" && orientation != "E" && orientation != "W"
  #         return "The robot's orientation must be N, S, E or W"
  #       end
  #   end
  # end

  
