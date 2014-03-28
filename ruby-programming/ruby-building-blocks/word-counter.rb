# get a line of words and then do a word count on it
puts "Enter a line of words"
line = gets.chomp

words = line.downcase.split(' ') # lowercase just makes it easier

# transform to hash table and count?
h = Hash.new(0) # set default to 0 if it can't be found

words.each do |word|
    h[word] += 1
end

puts h