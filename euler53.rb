def combinator(n,r)
  return 1 if n <= r
  fact = ->(num){(1..num).inject{|p,n|p * n}}
  fact.call(n) / (fact.call(r) * fact.call(n-r))
end

# count of numbers whose combinator are greater than 10**6 
def aboveOneMillionCount(num)
  idx = (1..num/2).to_a.index &->(r){combinator(num,r) > 10**6}
  return 0 unless idx
  lower = (idx + 1)
  upper = num - lower # has same combinator with lower
  upper - lower + 1 #  
end

p (23..100).inject 0,&->(cnt,num){
  cnt + aboveOneMillionCount(num)
}
