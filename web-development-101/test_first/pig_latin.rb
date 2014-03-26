VOWELS = ['a', 'e', 'i', 'o', 'u']

def translate(words)
  # extract consanants from the word...
  word = words.split(' ').map
  word.map{|w| w.sub(/^(qu|[^aeiou](?:qu)?[^aeiou]*)(\w*)/, '\2\1') + "ay"}.join(' ')
end
  
  