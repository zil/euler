def palindromicNum?(num)
  base10 = num.to_s
  base2 = num.to_s(2)
  base10 == base10.reverse and base2 == base2.reverse
end

r = (1..10**6).inject do |sum,num|
  sum + (palindromicNum?(num) ?  num : 0)
end

p r
