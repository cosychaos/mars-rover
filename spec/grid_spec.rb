require "grid"

describe Grid do

  before(:each) do
    @grid = Grid.new(5,5)
  end

  it 'initialises a grid of 5 by 5' do
    expect(@grid.x).to eq(5)
    expect(@grid.y).to eq(5)
  end

  it 'initialises all scents to be false' do
    expect(@grid.is_scented?(1,1,"N")).to be false
    expect(@grid.is_scented?(0,0,"N")).to be false
  end

  it 'sets a scent to true' do
    @grid.set_scent(1,1,"W")
    expect(@grid.is_scented?(1,1,"W")).to be true
  end

end
