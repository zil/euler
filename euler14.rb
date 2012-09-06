$bit=Array.new(10**6,nil)
def sequence(n)
  tmp,ary = n,[]
  while tmp != 1 do
    ary << tmp
    tmp =(tmp.even? ? tmp /= 2 : 3*tmp + 1 )
    $bit[tmp]=true if tmp < 10**6
  end
  ary
end
def longestSeq(upper)
  start,res = 1,[]
  while start < upper do
    start += 1
    next if $bit[start]
    seq = sequence(start)
    res = seq if seq.size > res.size
  end
  res
end
p longestSeq(10**6)
