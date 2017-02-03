array = [[1,2,3], [4,5,6], [7,8,9]]

total = 0
array.each do |subarray|
  total += subarray.length
  #puts total
end

puts "Total is #{total}"  # <-- interpolation example



def prompt (say)
  print "#{say}: "
  get.chomp
end

p1 = prompt ('enter your name')
