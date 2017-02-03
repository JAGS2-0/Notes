class Hangman
attr_accessor :guesses

  def initialize(word)
    @word = word.chars
    @number_of_guesses = 10
    @guesses = []
    # @bad_guesses = []
  end

  def show_board
    blank_word = @word.map do |n|
      n = '_'
    end
    puts "Here is your word: #{blank_word}"
  end

  def prompt_player
    puts 'Guess a letter! > '
    gets.chomp
  end

  def store_guess (letter)
    @guesses.push(letter)
  end

  def word_evaluate(letter)
    @number_of_guesses -= 1
    # @guesses = ['c']
    @guesses.push(letter)
    @word.map do |n|
      if @guesses.each.include?(n)
        n
      else
        '_'
      end
    end
  end

  def won
    if @word.include?('_')
      puts 'You won!'
    end
  end

  def lose
    @number_of_guesses < 1
  end

end


game = Hangman.new ('carry')
game.show_board
until game.lose || game.won
  letter = game.prompt_player
  @word2 = game.word_evaluate(letter)
  puts "Here is your word #{@word2}!"
  puts "Here are your guesses: #{game.guesses}"
  # @words2.won
 end





