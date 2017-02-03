i = 0

# creating loop using loop method
loop do  # this block will continue to run until i is > 5 in which case it will break
  puts 1
  i += 1
  if i > 5
    break
  end
end


# creating a loop using until
until i > 5
  puts i
  i += 1
end

y = 0
while y <= 5
  puts y
  y += 1
end