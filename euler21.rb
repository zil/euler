require_relative 'euler_util'
def amicable(n)
  factors = Factor.split(n)
  factors.delete(n)
  sum = factors.inject do |s,f|
    s += f
  end
  return nil if n == sum

  other_factors = Factor.split(sum)
  other_factors.delete(sum)
  other_sum = other_factors.inject do |sum,f|
    sum += f
  end

  return other_sum == n ? sum : nil
end

def amicableSum
  res = []
  2.upto(9_999) do |num|
    next if res.member?(num)
    ami = amicable(num)
    res << num << ami if ami
  end
  res.inject{|s,r|s+=r}
end

p amicableSum
