print 'Enter a Number >'
input = gets.chomp # .chomp removes the /n line break that ruby always adds when a user hits 'enter' at the end of gets
number = input.to_i

if number.to_s == input
  #user typed in a number
  if number.even?
    puts "#{number} is even"
  else
    puts "#{number} is odd"
  end
else
  # not a number
  puts "\"#{input}\", is not a number." # the forward slashes allow double quotes to be read as plain text, not code
end

----- #second method for writing same code, use Integer vs to_1
loop do
  print 'Enter a Number (or quite to exit)> '
  input = gets.chomp

  if input == "quit"
    break
  end

  begin
    number = Integer(input)

    #if it works
    if number.even?
      puts "#{number} is even"
    else
      puts "#{number} is odd"
    end

  rescue
    # if there was an error
    puts "\"#{input}\", is not a number."
  end
end

puts "We're Done!"

------  # using while instead of loop

while input != "quit"
  print 'Enter a Number (or quite to exit)> '
  input = gets.chomp

  begin
    number = Integer(input)

    #if it works
    if number.even?
      puts "#{number} is even"
    else
      puts "#{number} is odd"
    end

  rescue
    # if there was an error
    puts "\"#{input}\", is not a number."
  end
end

puts "We're Done!"