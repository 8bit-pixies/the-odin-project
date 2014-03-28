dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]

def substring(word, dictionary)
    result = Hash.new(0)
    word = word.downcase
    dictionary.each do |w|
        if word.index(w)
            result[w] += 1
        end
    end
    
    result
end

def substr_sentence(sentence, dictionary)
    words = sentence.downcase.split(' ')
    res = {}
    words.each do |word|
        puts word
        result = substring(word, dictionary)
        res = res.merge(result)
    end
    res
end

puts substring("going", dictionary)
puts substr_sentence("How's it going", dictionary)

