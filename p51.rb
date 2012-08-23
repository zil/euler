require 'mathn'
require_relative 'primes'

primes = getPrimes.select{|p| p > 10000}
res = nil;
primes.each{|number|
  no4replace,ns = nil,number.to_s
  ['0','1','2'].each{|v|
    next if not [3,6].member?(ns.count(v))
    pcount = 0
    (v..'9').each{|c|
      rno = ns.gsub(v,c)
      pcount += 1 if rno.to_i.prime?
    }
    if pcount == 8 
      res=number
      break
    end
  }
  break if res
}

puts res


