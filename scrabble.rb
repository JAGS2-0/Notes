# Scrabble Tally

print 'Player 1, please enter your name: '
p1 = gets.chomp

print 'Player 2, please enter your name: '
p2 = gets.chomp

p1_total = 0
p2_total = 0
# words = ['quit', 'stop', 'end' 'exit']
  loop do

    print "#{p1}, please enter your score: "
    input = gets.chomp

      if input == 'quit'
      then break
      end

    p1_score = input.to_i
    p1_total += p1_score
    puts "Thanks, #{p1}!  Your score is #{p1_total}"

    print "#{p2}, please enter your score: "
    input = gets.chomp

      if input == 'quit'
      then break
      end

    p2_score = input.to_i
    p2_total += p2_score
    puts "Thanks, #{p2}!  Your score is #{p2_total}"

  end

puts "Thanks for playing #{p1} and #{p2}!"
puts "#{p1}, your score is #{p1_total}"
puts "#{p2}, your score is #{p2_total}"

if
  p1_total > p2_total
  puts "#{p1} is the winner!"
elsif
  p2_total > p1_total
  puts "#{p2} is the winner!"
else
  puts 'you are both winners!'
end
