def solutions(num)
  cnt = 0
  upper = num / 2 - 1
  lower = num / 3
  lower = (lower.even? ? lower + 2 : lower + 1)
  lower.step(upper,2) do |c|
    a_b = num - c
    1.upto(a_b / 2) do |a|
      b = a_b - a
      cnt += 1 if a**2 + b**2 == c**2
    end
  end
  cnt
end

max = 1.upto(1000).max_by{|n|solutions(n)}
p max
