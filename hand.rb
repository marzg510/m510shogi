class Hand
  attr_accessor :order,:from_x,:from_y,:piece,:to_x,:to_y,:promote
  def initialize(order,from_x,from_y,to_x,to_y,piece,promote)
    @order = order
    @from_x = from_x
    @from_y = from_y
    @to_x = to_x
    @to_y = to_y
    @piece = piece
    @promote = promote
  end
end