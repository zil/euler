require_relative 'euler_util'

def factors_size(int)
  Factor.split(int).size
end

def divisors
  start,tnum = 1,0
  loop do
    tnum += start
    start += 1
    next if tnum < 501
    break if factors_size(tnum) > 500
  end
  [tnum,start-=1]
end

p divisors
