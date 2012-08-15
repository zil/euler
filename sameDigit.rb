
def sameDigit?(n1,n2)
  (n1.to_s.each_char.to_a.sort).eql? n2.to_s.each_char.to_a.sort
end
digit,res = 5,nil
loop do
  upper=(10**digit/6.0).ceil
  (10**(digit-1)).upto(upper){|n|
    res= n if [2,3,4,5,6].all?{|m|sameDigit?(n,n*m)}
  }
  digit += 1
  break if res
end
puts res
