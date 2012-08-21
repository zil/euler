require 'mathn'
require_relative 'primes'

def difference(count)
  return [[],[],[10]][count]if count < 3

  tmp=[]
  1.upto(count-1){|c|
    perm = []
    c.times{ perm << '1'}
    (count-1-c).times{ perm << '0'}
    perm.permutation.to_a.uniq.sort.each{|digits|
      tmp << digits.join.to_i*10
    }
  }
  tmp
end

def check?(prime,diff)
  pchars = prime.to_s.chars.to_a.reverse
  digit,max=nil,'0'
  diff.to_s.chars.to_a.reverse.each_with_index{|v,i|
    if "1"==v
      return false if pchars[i] > "2"
      return false if digit && digit != pchars[i]      
      digit = pchars[i] 
      max = pchars[i] if pchars[i] > max
    end
  }
  
  primeCount=1
  1.upto(9-max.to_i){|n|
    tmp = prime + n * diff
    primeCount += 1 if tmp.prime?
  }
  return primeCount==8
end

primes=getPrimes.select{|p| p > 10000}
res = nil;
primes.each{|number|
  diffs=difference(number.to_s.size)
  diffs.each{|d|
      if check?(number,d)
        res = [number,d]
        break
      end 
  }
  break if res
}

puts res


