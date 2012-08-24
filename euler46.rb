require 'mathn'
require_relative 'primes'

def prime_square(primes,num)
  pidx = 1
  loop do
    tmp  = num - primes[pidx]
    return false if tmp <= 0
    root = Math::sqrt(tmp / 2)
    return true if root.ceil == root.floor
    pidx += 1
  end
end

primes = getPrimes
number = 7
loop do
  number += 2
  next if number.prime?
  break unless prime_square(primes,number)
end

p number
