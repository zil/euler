require 'mathn'
def primesSum
  sum , pri = 0,Prime.instance
  primes = pri.take_while{|p|p < 2 * (10**6)}
  primes.inject{|s,p|s += p}
end

p primesSum
