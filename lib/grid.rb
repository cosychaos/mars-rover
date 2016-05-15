class Grid

  attr_accessor :x, :y, :scent

  def initialize(array)
    @x = array[0]
    @y = array[1]
    @scent = []
  end

  def set_scent(x,y, orientation)
    @scent << coordinates(x,y, orientation)
  end

  def is_scented?(x,y, orientation)
    @scent.include? coordinates(x,y, orientation)
  end

  def coordinates(x,y, orientation)
    x.to_s + "," + y.to_s + "," + orientation
  end

end
