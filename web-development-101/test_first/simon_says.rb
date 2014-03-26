def echo(word)
  word
end

def shout(word)
  word.upcase
end

def repeat(word, times=2)
  ([].push(word)*times).join(" ")
end

def start_of_word(word, n)
  word[0..(n-1)]
end

def first_word(word)
  /(^\w+)/.match(word)[0]
end

LITTLE_WORDS = ['and', 'the', 'over']

def titleize(line)
  line.capitalize.split(' ').map{|w| LITTLE_WORDS.include?(w) ? w : w.capitalize}.join(' ')
end