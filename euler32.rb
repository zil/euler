def pandigital(digitA,digitB,&calc)
  res,digits = [],(1..9).to_a
  first = digits.permutation(digitA).reject{|d|calc.call(d)}
  first.each do |d1|
    remain = digits - d1
    remain.permutation(digitB) do |d4|
      num1,num4 = d1.join.to_i,d4.join.to_i
      product = num1 * num4
      pnums = product.to_s.chars.to_a.map{|c|c.to_i}.sort
      last4 = (remain - d4).sort
      res << [num1,num4,product] if pnums == last4
    end
  end
  res
end

def sum
  cal1 = lambda{|d| [1,5].member?(d)}
  cal2 = lambda{|d| d[1] == 5}
  all = pandigital(1,4,&cal1) + pandigital(2,3,&cal2)
  sum = all.map{|a|a[2]}.uniq.inject{|s,p|s + p}
end

p sum
