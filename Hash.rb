# def number_of_es(str)
#   str.split('').select { |c| c == 'e' }.count
# end
# def number_of_as(str)
#   str.split('').select { |c| c == 'a' }.count
# end

def letter_count(str, letter)
  str.split('').select { |c| c == letter }.count
end

def letter_frequencies(str)

end

str = "where's the beef?"

n = letter_count(str, 'e')
puts "#{n} e's"

puts "#{letter_count(str, 'a')} a's"