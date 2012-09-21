require 'mathn'

def range_ab
  a = (1..1000).select{|n|n.odd?}
  b = (1..1000).select{|n|n.prime?}
  [a,b]
end

def consecutive(a,b)
  n1 = 0
  loop do
    tmp = n1*n1 + a*n1 + b
    return n1 unless tmp > 0 && tmp.prime?
    n1 += 1
  end
end

def maxCoefficients
  ra,rb = range_ab
  res,maxLen = [],0
  ra.each do |a|
    rb.each do |b|
      com = [[-a,b],[a,-b],[-a,-b],[a,b]];
      lens = com.map{|c|consecutive(c[0],c[1])}
      len = lens.max
      if len > maxLen
        maxLen = len
        res = com[lens.index(maxLen)]
      end
    end
  end
  res
end

coes =  maxCoefficients
p coes[0]*coes[1]
