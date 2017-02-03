class Fizzbuzzer

  def initialize
    @rules = {}
  end

  def register_rule(number, replacement)
    # @rules[2] = replacement
    @rules[number] = replacement
  end

  def rule_for(number)
    # @rules[2] => "A"
    @rules[number] # this is only going to return one value for the specific key you ask it for.  IF you want all the values, then you'd have to use the 'values' method
  end

  def apply_one(n)
    matches = []
    @rules.each do |base,replacement|
      if n % base == 0
        matches.push replacement
      end
    end

    if matches.length == 0
      n
    else
      matches.join ''
    end

    # matches = @rules.select do |base, replacement|
    #   n % base == 0
    # end
    #
    # if matches.empty? # or matches.count == 0
    #   n
    # else
    #   matches.values.join('') # gives you an array of the values in the hash
    # end
    #
    # return n # if you put this return in the loop, then the loop will end. so the return must be outside the loop to go through all rules
  end

  def run(range_max)
    (1..range_max).to_a.map do |n|
      apply_one(n)   #this has an implied 'self.apply_one'.  You are calling the method on the line above

    end
  end

end