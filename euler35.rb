require 'mathn'
require_relative 'primes'
def circularPrimes(prime)
  rotate = prime
  digits = prime.to_s.size
  power = 10 ** (digits - 1)
  primes = []
  begin
    remainder = rotate % power
    quotient = rotate.div(power)
    rotate = 10 * remainder + quotient
    return nil unless rotate.prime?
    primes << rotate
  end until rotate == prime
  return primes
end

def result
  primeList = getPrimes.select{|n|n < 10**6}
  res = []
  primeList.each do |prime|
    next if res.rindex(prime)
    cirPrimes = circularPrimes(prime)
    res += cirPrimes if cirPrimes
  end
  res.size
end

p result
