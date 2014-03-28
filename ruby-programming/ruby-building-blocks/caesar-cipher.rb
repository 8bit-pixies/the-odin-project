# create caesar cipher...
# firstly get a list of all the letters

letters = ('a'..'z').to_a # these may not be necessary
mod = letters.length # these may not be necessary

def caesar_cipher(text, shift)
    secret = ''
    lower = ('a'..'z').to_a
    upper = ('A'..'Z').to_a
    
    text.split(//).each do |w|
        #a.index('a')
        if lower.index(w)
            secret += lower[(lower.index(w) + shift) % lower.length]
        elsif upper.index(w)
            secret += upper[(upper.index(w) + shift) % upper.length]
        else
            secret += w
        end
    end
    secret
end
    
puts caesar_cipher("chapman", 1)
puts caesar_cipher("chapman", 0)
puts caesar_cipher("Chapman", -1)
puts caesar_cipher("chapman", 15)


