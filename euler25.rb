def fibo(digits)
  num = 10 ** (digits-1)
  idx,f1,f2 = 2,1,1
  while f2 / num == 0 do
    f2,f1 = f2+f1,f2
    idx += 1
  end
  [idx,f2/num,f1/num]
end

p fibo(1000)
