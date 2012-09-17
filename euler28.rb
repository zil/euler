def spiralSum(n)
  return 0 if n.even?
  return 1 if 1==n
  return 25 if 3==n
  right_bottom = 3
  (5..n).step(2).inject(25) do |sum,edge|
    right_bottom += (3 * (edge - 3) + (edge-1))
    sum + (4*right_bottom + 6*(edge-1))
  end
end

p spiralSum(1001)
