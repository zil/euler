class ChainNumber
  attr_reader(:num,:type,:end,:start)

  def initialize(num,type)
    @num = num
    @type = type
    @start = num / 100
    @end = num % 100
  end
  
  def notSame?(o)
    return true if not o
    @num != o.num && @type !=o.type
  end

  def concatable?(other)
    @end == other.start
  end

end

f3 = ->(n){n*(n+1)/2}
f4 = ->(n){n*n}
f5 = ->(n){n*(3*n-1)/2}
f6 = ->(n){n*(2*n-1)}
f7 = ->(n){n*(5*n-3)/2}
f8 = ->(n){n*(3*n-2)}

formulas = [f3,f4,f5,f6,f7,f8]

$lst = []
formulas.each_with_index do |fn,idx|
  num = 0
  num += 1 while (fn.call(num+1) < 1000)

  loop do
    res = fn.call(num+1)
    break if res > 9999
    num += 1
    next if res % 100 < 10
    $lst << ChainNumber.new(res,idx)    
  end
end

size = $lst.size-1
catch :out do
  0.upto(size) do |idx1|
    l1 = $lst[idx1]
    0.upto(size) do |idx2|
      l2 = $lst[idx2]
      next unless l1.notSame?(l2)
      next unless l1.concatable?(l2)
      0.upto(size) do |idx3|
        l3 = $lst[idx3]
        next unless [l1,l2].all? &->(l){l.notSame?(l3)}
        next unless l2.concatable?(l3)
        0.upto(size) do |idx4|
          l4 = $lst[idx4]
          next unless [l1,l2,l3].all? &->(l){l.notSame?(l4)}
          next unless l3.concatable?(l4)
          0.upto(size) do |idx5|
            l5 = $lst[idx5]
            next unless [l1,l2,l3,l4].all? &->(l){l.notSame?(l5)}
            next unless l4.concatable?(l5)
            0.upto(size-5) do |idx6|
              l6 = $lst[idx6]
              next unless [l1,l2,l3,l4,l5].all? &->(l){l.notSame?(l6)}
              next unless l5.concatable?(l6)
              if l6.concatable?l1
                res= [l1,l2,l3,l4,l5,l6]
                puts (res.map &->(n){n.num}).reduce(:+)
                throw :out
              end
            end
          end
        end      
      end
    end
  end
end
