class Grid
  def initialize(x,y)
    @right,@top = x,y
    @cached = {}
  end

  def waysCount
    recurseFind(0,0)
  end
  
  def recurseFind(x,y)
    return 1 if y == @top || x == @right
    key = x.to_s + '-' + y.to_s
    res = @cached[key] || recurseFind(x + 1,y) + recurseFind(x,y + 1)
    @cached[key] = res unless @cached.key?(key)
    return res
  end

  private  :recurseFind
end

p Grid.new(20,20).waysCount
