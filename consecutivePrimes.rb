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

def getMaxContinus(primes,index)
  res=[index,0,0]
  sum,idx = primes[index],index
  if sum == 2
    sum += primes[index + 1]
    idx += 1
  end
  
  while (idx < primes.size - 3) do
    sum += primes[idx + 1]
    sum += primes[idx + 2]
    break if sum > primes[-1] 
    res[1,2]=[idx+2,sum] if sum.prime? 
    idx += 2
  end
  res
end

maxLength=[0,3,0]
primes=getPrimes

1.upto(primes.size - 3){|idx|
  res=getMaxContinus(primes,idx)
  next if not res
  maxLength = res if (res[1] - res[0]) > (maxLength[1] - maxLength[0])
}
puts maxLength
