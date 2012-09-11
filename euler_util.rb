class Factor
  def Factor.split(int)
    return [] unless int.is_a? Integer
    return [1] if int <= 1
    factor_ary,root = [1,int],Math::sqrt(int)
    if(root.floor == root.ceil)
      factor_ary << root
      upper = root-1
    else
      upper = root.floor
    end
    (2..upper).each do |n|
      factor_ary << n << (int / n) if int % n == 0
    end
    factor_ary
  end
end
