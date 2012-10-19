require 'mathn'

class NumSpiral
  
  def initialize(start,primeRatio)
    @primeRatio = primeRatio
    @stepDiff = 8
    @step = [10,12,14,16]
    @diagNum = [start+2,start+4,start+6,start+8]
  end
  
  def sideLenBelowPrimeRatio
    sideLen = 1                 # diagonal side length
    primeCnt,numCnt = 0,1
    while numCnt +=4  do
      sideLen += 2
      primeCnt += @diagNum.count{|n|n.prime?}
      return sideLen if primeCnt * 100 / numCnt < @primeRatio
      @step.each_with_index &->(val,idx){ @diagNum[idx] += val}
      @step.map!{|s| s += @stepDiff}
    end
  end
  
end

spiral = NumSpiral.new(1,10)
p spiral.sideLenBelowPrimeRatio
