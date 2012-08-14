def lt1e10 (n)
    i,sum,cons = 0,1,10**10
    while (i < n) do
      sum *= n
      sum %=cons if sum > cons
      i+=1
    end
  sum
end
#1.upto(1000){|n|puts "got you!#{n}" if 10**10 < lt1e10(n) }
r=1.upto(1000).inject { |s,n | s+ lt1e10(n) }
puts r % 10**10



