n1,n2,top = 1,2,4*(10**6)
sum = 0
while n2 < top
  sum += n2 if n2.even?
  n2,n1 = (n2 + n1),n2
end
p sum
