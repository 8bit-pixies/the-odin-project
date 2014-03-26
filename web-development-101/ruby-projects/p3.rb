# largest prime factor
# lets not use isprime (or do a solution with both)

def isPrime(number)
  i = 2
  limit = (Math.sqrt(number)).to_i
  while i < limit
    if number % i == 0
      return false
    end
    i += 1
    limit = number / i
  end
  return true
end

# get all the factors that are prime and see...
large_number = 600851475143 
puts (2..(Math.sqrt(large_number)).to_i).to_a.reverse!.detect {|x| (large_number % x == 0) && isPrime(x) }
