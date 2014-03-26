# even fibonacci numbers

fib_array = [1,1]
while fib_array[-1] < 4000000
    fib_array.push(fib_array[-1] + fib_array[-2])
end

puts fib_array.select {|x| (x % 2 == 0 ) && x < 4000000}.reduce(:+)


