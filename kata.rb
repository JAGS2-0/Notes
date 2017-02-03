class Person

  def initialize (name)
    @name = name
  end

  def greet
    puts "Hi, my name is #{@name}"
  end

end

p = Person.new('Jess Goodman')
puts p.greet # 'Hi, my name is 'Your Name'




# ns = 1 .. 100
# ns.each do |n|
#   if n % 3 == 0
#     puts 'Fizz'
#   else
#     puts n
#   end
# end
#
#
# numbers = []
# 10.times do
#   numbers.push rand(1..100)
# end
#
# # Convert array to string with commas
# def print_numbers(array)
#   array.each do |n|
#     print "#{n}, "
#   end
#   puts
# end
#
# puts "Initial numbers"
# print_numbers numbers