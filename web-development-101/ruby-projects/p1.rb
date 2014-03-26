# project euler ruby solutions

# find the sum of all numbers under 1000 whose multiples are 3, 5
puts (1..1000).select {|x| (x %3 == 0) || (x%5 == 0)}.reduce(:+)