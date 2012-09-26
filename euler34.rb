def factorial(num)
  (1..num).inject(:*) || 1
end

def upper
  fact9 = factorial(9)
  fact,num9 = fact9, 9
  while (num9 < fact)
    num9 = 10 * num9 + 9
    fact += fact9
  end
  fact
end

def numFact?(num,cached)
  sum,no = 0,num
  while (no > 0)
    d = no % 10
    no /= 10
    sum += cached[d]
  end
  num == sum
end

def sum
  facts = [1, 1, 2, 6, 24, 120, 720, 5040, 40320, 362880]
  nums = 3.upto(upper).select do |n|
    numFact?(n,facts)
  end
  nums.inject(0){|s,n|s + n}
end

p sum
