require 'set'
def isPrime(n)
  return false if n < 1
  return true if [1,2,3].include?(n)
  return false if n % 2 ==0
  root = Math.sqrt(n)
  res=3.upto(root-1).all?{|x| n % x > 0 }
  res
end

def fourDigitPrimes
  primes=[];
  1000.upto(9999){|x| primes << x if isPrime(x)}
  primes
end

h=Hash.new()
fourDigitPrimes.each{|x|
  key=x.to_s.each_char.sort.join
  val=h[key] || []
  val << x
  h.store(key,val)
}

result=Set.new []
h.select{|k,v| v.size >=3}.each{|k,v|
  permut = v.permutation(3).to_a
  permut.each{|p|
     result << p.sort if (p[2]-p[1] == p[1]-p[0])
  }
}
result.each{|v|puts v.join("")}
