max,res = 0,[]
1.upto(99){|base|
  1.upto(99){|n|
    tmp = base ** n
    sum = tmp.to_s.each_codepoint.inject(0){|s,c|
      s += (c - 48)
    }
    max,res = sum,[base,n] if sum > max
  }
}
p max,res
