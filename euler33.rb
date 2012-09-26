def cancel?(num,denom)
  digits = lambda{|d|[d / 10, d % 10]}
  nu = digits.call(num)
  de = digits.call(denom)
  com = nu & de
  return false if com.empty? || com.size == 2
  div1 = Rational((de - com)[0] , (nu - com)[0])
  div2 = Rational(denom,num)
  div1 == div2
end

def cancelFraction
  rej = lambda{|d|d/10 == d%10 || d %10 == 0}
  res = []
  (11..49).reject(&rej).each do |num|
    ((num+1)..99).reject(&rej).each do |denom|
      res << [num,denom] if cancel?(num,denom)
    end
  end
  res
end

p cancelFraction
