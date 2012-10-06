res = (9182..9876).inject([]) do |qulified,num|
  product = num * 10**5 + num * 2
  digits = product.to_s.chars.to_a
  qulified << product if digits.uniq.size == 9 and not digits.member?('0')
  qulified
end

p res.max 
