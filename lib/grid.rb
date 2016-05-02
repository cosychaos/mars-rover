class Grid

  attr_accessor :x, :y, :scent

  def initialize(x,y)
    @x = x
    @y = y
    @scent = []
  end

  def is_scented?(x,y, orientation)
    scent_location = ""
    scent_location << x.to_s + "," + y.to_s + "," + orientation
    @scent.include?(scent_location)
  end

  def set_scent(x,y, orientation)
    @scent << x.to_s + "," + y.to_s + "," + orientation
  end

end
