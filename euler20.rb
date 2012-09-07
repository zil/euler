def digitsSum
  res = (1..100).inject(1){|r,n|r *= n}
  res.to_s.chars.inject(0){|s,c|s += c.to_i}
end

p digitsSum
