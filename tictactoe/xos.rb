# Sketching out game
# creating an x and o game
# need a xo. class
# need two players, x and o?
# until g.winner || g.board_full?
   # x.prompt_for_move
   # o.prompt_for_move
#hard to start with player because it will require input which is hard to test gets
#end

class XOs
  attr_reader :turns_left

  def initialize
    @turns_left = 9
    @board = Array.new 9
  end

    def winner
      rows = [
          [1,2,3],
          [4,5,6],
          [7,8,9]
      ]
      rows.each do |row|
        if did_win_row?(row, 'X')
          return 'X'
        elsif did_win_row?(row, 'O')
          return 'O'
        end
      end
    end

    def did_win_row?(row, player)
      row.select { |pos| letter_at(pos) == player }.count == 3
    end

  def board_full?
    !@board.include?(nil) #- ! character means 'does not'
   # if @board.include?(nil)
   #   false
   # else
   #   true
   #  end
  end

  def take_turn(letter, position)
    @turns_left -= 1
    @board[position - 1] = letter #arrays start position at 0
  end

  def letter_at(position)
    @board[position - 1] #this shows the letter at the position
  end

end

