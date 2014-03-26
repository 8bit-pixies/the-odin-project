def reverser
  yield.split(' ').map{|w| w.reverse}.join(' ') if block_given?
end

def adder(n=1)
  yield+n if block_given?
end

def repeater(n=1)
  n.times{yield} if block_given?
end