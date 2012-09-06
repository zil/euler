def factors_size(int)
  return 0 unless int.is_a? Integer
  return 0 if int <= 3
  size,root = 0,Math::sqrt(int)
  if(root.floor == root.ceil)
    size,upper = 1,root-1
  else
    upper = root.floor
  end
  (2..upper).each do |n|
    size += 2 if int % n == 0
  end
  size
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
