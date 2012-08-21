require "mathn"
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
