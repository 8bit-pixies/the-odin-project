SMALL_WORDS = ['and', 'in', 'the', 'of', 'a', 'an']

class Book
  attr_accessor :title

  def title=(words)
    @title = words.capitalize.split(' ').map{|w| SMALL_WORDS.include?(w) ? w : w.capitalize}.join(' ')
  end
end