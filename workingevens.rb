loop do
  print 'Enter a Number (or quite to exit)> '

  begin
    input = gets.chomp
  rescue Interrupt   #when the user hits 'Ctrl + C' in the console, it raises an Interrupt error.  So we capture that and make it quit
      input = "quit"
  end

  if input == "quit"
    break
  end

  number = nil
  loop do
    begin
      number = Integer(input)
      break
    rescue
      puts "\"#{input}\", is not a number."
      print 'Please Try Again > '
      input = gets.chomp
    end
  end

  begin
    #if it works
    if number % 5 == 0  #modulus
      puts "#{number} is divisible"
    else
      puts "#{number} is not divisible"
    end

  rescue
    # if there was an error
    puts "\"#{input}\", is not a number."
  end
end

puts "We're Done!"