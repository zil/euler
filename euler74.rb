$fact = [1,1,2,6,24,120,720,5040,40320,362880]
def digitFactSum(num)
  tmp,sum = num,0
  while tmp > 0
    sum += $fact[tmp % 10]
    tmp /= 10
  end
  sum
end

$count = 0
2.upto(999_999) do |num|
  tmp = num
  chain = []
  while (not chain.member?(tmp)) do
    chain << tmp
    tmp = digitFactSum(tmp)
    break if chain.size > 60
  end
  $count += 1  if chain.size == 60
end

puts "chain count:#{$count}"
