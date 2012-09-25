require 'set'
def termsCount(noA,noB)
  terms = Set.new
  (2..noA).each do |a|
    (2..noB).each do |b|
      terms << a**b
    end
  end
  terms.size
end

p termsCount(100,100)
