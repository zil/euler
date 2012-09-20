def cycleLen(num)
  rem,val,pos =[],1,0
  while ((rem[val] == nil )) do
    rem[val] = pos
    val *= 10
    val %= num
    return 0 if val ==0
    pos += 1
  end
  pos - rem[val]
end

def longest
  (1000.downto(2)).max_by{|n|cycleLen(n)}
end

