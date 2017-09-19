class Piece
  attr_accessor :name,:promotable,:promoted_name,:move_range, :promoted_move_range
#  attr_reader :display_name
  def initialize(promotable,name,promoted_name:nil)
    @promotable = promotable
    @name = name
    @promoted_name = promoted_name
    @promoted = false
    @move_range = Array.new
    @promoted_move_range = Array.new
  end
  def to_s
    return @promoted_name if @promoted
    return @name
  end
  def promote
    @promoted = true if @promotable
    return self
  end
  def promote?
    @prmoted
  end
  def promotable?
    @promotable
  end
end

class Kin < Piece
  def initialize
    super(false,"金")
    @move_range = MOVE_RANGE
  end
  MOVE_RANGE = [
    [-1,-1],
    [ 0,-1],
    [ 1, 1],
    [-1, 0],
    [ 1, 0],
    [ 0, 1]
  ]
end

class Fu < Piece
  def initialize
    super(true,"歩",:promoted_name=>"と")
    @move_range << [ 0,-1]
    @promoted_move_range = Kin::MOVE_RANGE.clone
  end
end

class Kyo < Piece
  def initialize
    super(true,"香",:promoted_name=>"仝")
    @move_range << [ 0,-1]
    @move_range << [ 0,-2]
    @move_range << [ 0,-3]
    @move_range << [ 0,-4]
    @move_range << [ 0,-5]
    @move_range << [ 0,-6]
    @move_range << [ 0,-7]
    @move_range << [ 0,-8]
    @promoted_move_range = Kin::MOVE_RANGE.clone
  end
end

class Kei < Piece
  def initialize
    super(true,"桂",:promoted_name=>"今")
    @move_range << [ 1,-2]
    @move_range << [-1,-2]
    @promoted_move_range = Kin::MOVE_RANGE.clone
  end
end

class Gin < Piece
  def initialize
    super(true,"銀",:promoted_name=>"全")
    @move_range << [ 0,-1]
    @move_range << [ 0,-2]
    @move_range << [ 0,-3]
    @move_range << [ 1,-1]
    @move_range << [-1,-1]
    @promoted_move_range = Kin::MOVE_RANGE.clone
  end
end

class Kaku < Piece
  def initialize
    super(true,"角",:promoted_name=>"馬")
    (1..8).each do |i|
      @move_range << [-i,-i]
      @move_range << [ i,-i]
      @move_range << [-i, i]
      @move_range << [ i, i]
    end
    @promoted_move_range = @move_range.clone
    @promoted_move_range = << [ 0,-1]
    @promoted_move_range = << [-1, 0]
    @promoted_move_range = << [ 1, 0]
    @promoted_move_range = << [ 0, 1]
  end
end

class Hi < Piece
  def initialize
    super(true,"飛",:promoted_name=>"龍")
    (1..8).each do |i|
      @move_range << [ 0,-i]
      @move_range << [ i, 0]
      @move_range << [-i, 0]
      @move_range << [ 0, i]
    end
    @promoted_move_range = @move_range.clone
    @promoted_move_range = << [-1,-1]
    @promoted_move_range = << [ 1,-1]
    @promoted_move_range = << [-1, 1]
    @promoted_move_range = << [ 1,-1]
  end
end

class Ou < Piece
  def initialize
    super(false,"王")
    @move_range = Kin::MOVE_RANGE.clone
    @move_range << [ 1, 1]
    @move_range << [-1, 1]
  end
end

if __FILE__ == $0
  p = Piece.new(false,"歩")
  puts p
  fu = Fu.new
  p fu
  ou = Ou.new
  p ou
  fu.promote
  puts fu
  ou.promote
  puts ou
  p ou
  p Kin::MOVE_RANGE
  p Kin.new
  p Kyo.new
  p Kei.new
  p Gin.new
  p Kaku.new
end