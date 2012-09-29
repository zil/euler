require 'mathn'
def truncatable?(prime)
  power = prime.to_s.size - 1
  divisor = 10 ** power
  while divisor > 1 do
    left,right = prime.divmod(divisor)
    return false unless right.prime? and left.prime?
    divisor /= 10
  end
  true
end

res,primeGen = [],Prime.new
while(nxt = primeGen.next) do
  next if nxt < 10
  res << nxt if truncatable?(nxt)
  break if res.size == 11
end

p res.inject{|s,n|s + n}
