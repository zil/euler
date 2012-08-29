require 'mathn'

start,init,res =1,1,0
while start <= 1000
  init = 1 + (1 / (1 + init))
  res += 1 if init.denominator.to_s.length < init.numerator.to_s.length
  start += 1
end
p res
