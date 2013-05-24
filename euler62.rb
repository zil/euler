require 'set'
class Integer
  def natural_digits
    div,d = self,[]
    while div > 0
      div,rem = div.divmod(10)
      d.unshift << rem
    end
    d.sort.join
  end
end

def cube
  init,map = 345,Hash.new
  while ((init += 1) < 10000) do
    n = init ** 3
    key = n.natural_digits
    val = map[key] || []
    val << init
    map.store(key,val)
  end
  res = map.select{|k,v| v.size == 5}.map{|k,v| v.min}
  res.min ** 3
end

p cube
