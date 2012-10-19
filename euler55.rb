def lychrel?(n)
  rev = n
  50.times do
    revS = rev.to_s
    rev = revS.reverse.to_i + revS.to_i
    sumS = rev.to_s
    return false if sumS == sumS.reverse
  end
  true
end

p (1..10**4).count &->(n){lychrel?(n)}
