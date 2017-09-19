require './board.rb'
require './piece.rb'
require './hand.rb'

if __FILE__ == $0
  b = Board.new
  b.put(1,7,Fu.new,0)
  b.put(2,7,Fu.new,0)
  b.put(3,7,Fu.new,0)
  b.put(4,7,Fu.new,0)
  b.put(5,7,Fu.new,0)
  b.put(6,7,Fu.new,0)
  b.put(7,7,Fu.new,0)
  b.put(8,7,Fu.new,0)
  b.put(9,7,Fu.new,0)
  b.put(5,9,Ou.new,0)
  b.put(1,3,Fu.new,1)
  b.put(2,3,Fu.new,1)
  b.put(3,3,Fu.new,1)
  b.put(4,3,Fu.new,1)
  b.put(5,3,Fu.new,1)
  b.put(6,3,Fu.new,1)
  b.put(7,3,Fu.new,1)
  b.put(8,3,Fu.new,1)
  b.put(9,3,Fu.new,1)
  b.put(5,1,Ou.new,1)
  b.show
  p,o = b.get(1,7);puts "get1,7=#{p}#{o}"
  puts "get3,3=#{b.get(3,3).to_s}"
end
