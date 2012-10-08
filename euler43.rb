def subDivisableProperty?(digits)
  divisors = [2,3,5,7,11,13,17]
  (0..divisors.size-1).all? do |d|
    val = digits[1+d]*100 + digits[2+d]*10 + digits[3+d]
    val % divisors[d] == 0
  end
end

def divisibilityNums
  digits = (0..9).to_a
  result = digits.permutation.select do |num|
    subDivisableProperty?(num)
  end
  result.map{|r|r.join.to_i}
end

p divisibilityNums.inject(0){|s,n|s+n}
