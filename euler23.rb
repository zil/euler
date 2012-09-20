require 'mathn'
require_relative 'euler_util'
def abnudantNO(upper)
  noprime = (12..upper).reject{|no|no.prime?}
  noprime.select{|no|Factor.proper_sum(no) > no}
end

def no2abunSum
  ary,anos = [] , abnudantNO(28123)
  anos.each_with_index do |vo,idx|
    anos[idx..anos.size-1].each do |v|
      tmp = vo + v
      ary << tmp if tmp < 28124
    end
  end
  ((1..28123).to_a - ary).inject{|s,n|s + n}
end
p no2abunSum

