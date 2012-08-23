require "mathn"
def getPrimes
  begin
    pf=File.new("primes.tmp")
    savedPrimes=Marshal.load(pf)
    return savedPrimes if savedPrimes
  rescue
    p=[2]
    3.upto(10**6){|n|
      next if n.even?
      p << n if n.prime?
    }
    Marshal.dump(p,File.new("primes.tmp",'w'))
    p
  end
end
