# -*- coding: utf-8 -*-
require 'mathn'

def getPrimes
  begin
    pf=File.new("primes.tmp")
    savedPrimes=Marshal.load(pf)
    return savedPrimes if savedPrimes
  rescue
    p=[]
    2.upto(10**6){|n|
      next if n.even? || n % 5==0
      p << n if n.prime?
    }
    Marshal.dump(p,File.new("primes.tmp",'w'))
    p
  end
end

def getMaxContinus(primes,start)
  res=[start,0,0]
  return res if start > primes.size - 4

  start.upto(primes.size-4){|index|
    sum,idx = primes[index],index
    if index==0
      idx=1;
      sum += primes[1]
    end

    while (idx < primes.size - 3) do
      sum += primes[idx + 1]
      sum += primes[idx + 2]
      break if sum > primes[-1]
      res=[index,idx+2,sum] if ((idx+2-index) > res[1]-res[0] ) && sum.prime? 
      idx += 2
    end
  }
  res
end

primes=getPrimes
res=getMaxContinus(primes,0)
puts res
puts (res[0]..(res[0]+res[1]-1)).inject(0){|su,r|su + primes[r]}
