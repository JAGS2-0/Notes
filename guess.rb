class GuessingGame

  def initialize (max)
    @max = max
    @answer =  rand 1..max
    @tries_left = 5
    @won = false
  end

  attr_reader :max #this helps game.max in the player class

  def out_of_turns?  #All this does is determine if you have turns.  What to do with that data lives in the 'until'
    @tries_left == 0
  end

  def got_answer?
    @won
  end

  def check_number (guess)
    @tries_left -= 1
    if guess == @answer
      then
      @won = true
    elsif guess < @answer
      puts "Too Low!"
      :low  #returning a symbol to pass into the SmartAI class
    else
      puts "Too High!"
      :high
    end
  end

  def answer  #attr_reader :answer -> this is short hand for writing a method that only returns an instance variable.
    @answer   # this only works if the method name and instance variable are named the same
  end

end

class Player

  def initialize(_)
  end

  def ask_for_number (game)
    puts "Guess a Number between 1 - #{game.max}"  # you are passing in the object 'game' as the parameter so you may use all the game
    gets.chomp.to_i                               #information.  You still need the '.max' method to call the max number from the game
  end

  def record_result(_)
  end

end

class BadAI

  def initialize(_)
  end

  def ask_for_number(game)
    guess = rand 1 .. game.max
    puts "Guessing #{guess}"
    guess
  end

  def record_result(_)
  end

end

class SmartAI

  def initialize(game)
    @min = 1
    @max = game.max
  end

  def ask_for_number (game)
    @last_guess = (@min + @max) / 2
    puts "Guessing #{@last_guess}"
    @last_guess
  end

  def record_result(result)
    if result == :low
      @min = @last_guess
    elsif result == :high
      @max = @last_guess
    end
  end
end



# print "Set Max Number"
# n = gets.chomp.to_i
n = 100
g = GuessingGame.new n
p = SmartAI.new g #Player.new #BadAI.new

until g.out_of_turns? || g.got_answer?
  guess = p.ask_for_number g
  result = g.check_number(guess)
  p.record_result result
end

if g.got_answer?
  puts "You Win"
else
  puts "You Lose.  The answer was #{g.answer}"
end