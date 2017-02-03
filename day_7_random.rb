numbers = []
1000.times do
  numbers.push rand(1..10)
end

#How many times does each number show up?  You need a hash
counts = {}
# counts[x] = 0 # this sets each key's value in the hash to 0 as a starting point;  count[x] # this is the current count for 1 e.g. the 'old count'

numbers.each do |x|  # counts[x] is nil to start because the hash is empty, so you will get nil
  if counts[x] == nil
    counts[x] = 0     # this is a guard clause. this may also be written as counts[x] = counts[x] || 0
  end

counts[x] =+ 1
end
puts counts

# final way to figure out how may number show up each time
counts2 = {}
counts2.each do |x|
  counts[x] ||= 0 # when you call x the first time through it is nil because counts is an empty hash.  this says if it's nil, set to 0
  counts[x] += 1
end

counts = Hash.new(0) # this sets counts to 0 so you do not need to or clause
numbers.each do |x|
  counts[x] += 1
end