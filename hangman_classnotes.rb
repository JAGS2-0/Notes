File.read("/usr/share/dict/words")  #file.read returns the contents of a file in a string

Dictionary = [
    "banana",
    "jazz",
    "something"

] #good way to start randomly picking a letter for your game

class Hangman
attr_reader :word
  def initialize
    @guesses = []
    # @word = Dictionary.sample
    @turns = 7
    contents = File.read '/usr/share/dict/words'
    words = contents.split
    good_words = words.select do |w|
      4 <= w.length && w.length <= 9 && w.downcase == w
    end

    @word = good_words.sample

    # position = rand 0 .. (Dictionary.length - 1)
    # @word = Dictionary[position]
    # this is the longer way to get a random word, but explains how 'sample' works
  end

  def ask_for_user_input
    puts "The answer is #{@word}"
    print '> '
    letter = gets.chomp

    if @word.include? letter
      puts 'Correct!'
    else
      puts 'No!'
      @turns -= 1
    end
    @guesses.push (letter)
  end

  def show_board
    array = []
    @word.chars.each do |char|
      if @guesses.include? char
        array.push(char)
      else
        array.push('_')
      end
    end
    array.join(' ')
  end

  def show_guesses
    puts @guesses.join(',')  #Shows all letters as x,y,z
    puts "You have #{@turns} turns left"
  end

  def out_of_turns?
    @turns == 0  # double equal is a comparison NOT setting
    # if @turns == 0
    #   true
    # else
    #   false
    # end
    puts "The answer was: #{g.word}"
  end

  def found_answer?
    # !show_board.include?('_')
    @word.chars.all? do |letter|
      @guesses.include? letter
    end
    puts 'You won!'
  end

end


g = Hangman.new

until g.out_of_turns? || g.found_answer? do
  g.ask_for_user_input
  puts g.show_board
  g.show_guesses
end

