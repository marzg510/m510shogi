require 'logger'
require './piece.rb'

class Board
  attr_accessor :log
  attr_reader :squares,:belongings
  def initialize(log:Logger.new(STDOUT))
    @log = log
    @squares = Array.new(9){ Array.new(9) {Square.new} }
    @belongings = Array.new(2){Array.new}
  end
  def sizex
    @squares[0].length
  end
  def sizey
    @squares.length
  end
  def get(x,y)
    return @squares[y-1][x-1].piece ,@squares[y-1][x-1].order
  end
  def put(x,y,piece,order)
    return @squares[y-1][x-1].put(piece,order)
  end
  def remove(x,y)
    @squares[y-1][x-1].remove
  end
  def add_belongings(piece,order)
    @belongings[order] << piece
  end
  def show
#    puts "#{sizex},#{sizey}"
    puts "持ち駒:#{@belongings[1].join(',')}"
    @squares.each_with_index do |row,y|
      puts "  9   8   7   6   5   4   3   2   1" if y == 0
      puts "|#{row.reverse.join('|')}|#{y+1}"
    end
    puts "持ち駒:#{@belongings[0].join(',')}"
  end
end

class Square
  attr_reader :piece,:order
  def initialize
    @piece = nil;
    @order = nil;
  end
  def put(piece,order)
    @piece = piece
    @order = order
    return self
  end
  def remove
    @piece = nil
    @order = nil
    return self
  end
  def to_s
    return @piece == nil ? "   " : "#{@piece.to_s}#{order==0 ? '^' : 'v'}"
  end
end

if __FILE__ == $0
  b = Board.new
  b.put(1,7,Fu.new,0)
  b.put(5,5,Ou.new,1)
  b.put(3,8,Fu.new.promote,1)
  b.add_belongings(Fu.new,0)
  b.add_belongings(Fu.new.promote,0)
  b.show
  p,o = b.get(1,7);puts "get1,7=#{p}#{o}"
  puts "get3,3=#{b.get(3,3).to_s}"
end
