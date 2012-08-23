require 'set'
require_relative 'primes'

def multiBy4Prime?(primes,num)
  factor,tmp,idx = Set.new,num,0
  while tmp != 1 do
    p = primes[idx]
    return false if factor.size > 4 || (p > tmp)
    if (tmp % p)==0
      tmp = tmp / p
      factor << p
    else
      idx += 1
    end
  end
  factor.size == 4
end

primes = getPrimes
start = 211

while start < primes[-1] do
  jump = 0
  if multiBy4Prime?(primes,start)
    jump = [1,2,3].detect{|idx| not multiBy4Prime?(primes,start + idx)}
  end
  break if not jump
  start += (jump + 1)
end

puts start

