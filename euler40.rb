def digitProduct
  product,power = 1,0
  num,cnt = 1,0
  while power <= 6
    cnt += num.to_s.size
    if cnt >= 10**power
      idx =  -(cnt - 10**power) - 1
      product *= num.to_s[idx].to_i
      power += 1
    end
    num += 1
  end
  product
end

p digitProduct
