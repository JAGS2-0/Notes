def prompt (label)
  puts "#{label} > "
  gets.chomp # this is getting the user input, storing it in a variable, then returning it.  this is how it gets stored in your variable
end

def prompt_for_number (label)
  input = prompt (label) # calling the prompt method, but sending the argument from this method.
  loop do
    begin
      return Integer(input) # you do not need to store the return value in the method as long as you are storing it when you call the method
      # break - this is not needed because a function can only return 1 value.
    rescue
      puts "\"#{input}\", is not a number."
      print 'Please Try Again > '
      input = gets.chomp
    end
end


p1 = prompt ('Player 1, what is your name?')
score1 = 0

p2 = prompt ('Player 2, what is your name?')
score2 = 0


loop do
  # Player 1's turn
  input = prompt_for_number ("#{p1}, your score")
  if input == -1
    break
  end

  score1 += input

  # Player 2's turn
  input = prompt_for_number ("#{p2}, your score")
  if input == -1
    break
  end

  score2 += input
end

# Print final scores
puts 'Final scores'
puts "#{p1}: #{score1}"
puts "#{p2}: #{score2}"

# Print winner
if score1 > score2
  puts "#{p1} wins!"
elsif score2 > score1
  puts "#{p2} wins!"
else
  puts "It's a tie!"
end