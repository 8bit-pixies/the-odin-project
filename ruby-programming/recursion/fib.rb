def fib(n)
    first=1
    second=1
    i=2
    
    while i < n
        first, second = second, first+second
        i = i+1
    end
    
    second
end

puts fib(3)
puts fib(4)
puts fib(10)

def fib_rec(n)
    return n <= 2 ? 1 : fib_rec(n-1) + fib_rec(n-2)
end

puts fib_rec(3)
puts fib_rec(10)

