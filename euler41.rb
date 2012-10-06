require 'mathn'
def genMaxNum
  digits = (1..7).to_a
  nums = digits.permutation.map{|m|m.join.to_i}
  nums.select{|n|n.prime?}.max
end
p genMaxNum
