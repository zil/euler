def pentagonalNO?(num)
  root = ((1 + num * 24) ** 0.5 + 1) / 6
  root == root.floor
end

def minPentagonalDifference
  num,cached =1,[1]
  loop do
    num += 1
    p2 = num * (3 * num - 1) / 2
    cached.each do |p1|
      sum = p1 + p2
      diff = p2 - p1
      return diff if pentagonalNO?(sum) && pentagonalNO?(diff)
    end
    cached.unshift(p2)
  end
end

p minPentagonalDifference
