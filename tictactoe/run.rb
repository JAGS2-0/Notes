require_relative 'player'
require_relative 'xos'


g = XOs.new
x = Player.new
o = Player.new

until g.winner || g.board_full?
  x.prompt_for_move

  o.prompt_for_move
end
