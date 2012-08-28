hIdx = 143

loop do
  hIdx += 1
  tmp = hIdx * (2 * hIdx -1)
  root = Math::sqrt(tmp * 24 + 1)
  next if root.ceil != root.floor
  break if (root.ceil + 1) % 6 == 0
end
res = hIdx * (2 * hIdx - 1)
p "hIdx=#{hIdx},res=#{res}"
