class Repeater
  def initialize (phrase)
    @phrase = phrase
  end

  def repeat (n)
   x = n.times.map do  # .map know that you are pushing into an array, so it automatically defines your variable for you.
     @word             # this means that you do not have to add x = [], .map does that for you
   end
    x

   # this method returns 'x' because it functions like 'each' - you are not actually returning the value
    # x.times do
    #   @phrase
    # end
  end

end

r = Repeater.new "Hello!"
r.repeat 3