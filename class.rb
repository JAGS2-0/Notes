class Counter

  def initialize(n)  # this makes it so that when you call this method, your new instance of the class starts with an internal counter n.
    #puts 'init'
    @number = n
  end

  def up
    puts "Up"
    @number +=1
    puts "@number = #{@number}"
  end

  def count
    puts "count"
    @number   # returns the number
  end

  def reset(n=0)  # i want to reset the number to whatever I give you OR setting a default to 0
    puts "reset"
    @number = n
  end

end

c =  Counter.new(5)  # this 'initializes' or actually creates your counter

c.up
c.up

puts c.count # 2

c.reset(20)

puts c.count # 0

c.reset
puts c.count #0