class Card
  @@NUM = "23456789TJQKA"
  attr_reader :num,:color
  def initialize(val)
    @num = @@NUM.index(val[0]) + 2
    @color = val[1]
    unless @num and ["H","D","S","C"].member?(@color)
      raise Invalid,"Wrong Card constructor arguments : #{val}"
    end
  end
  
  include Comparable
  def <=> (o)
    @num <=> o.num
  end
  
  def to_s
    "#{@@NUM[@num-2]}#{@color}"
  end
end

class Hand
  include Comparable
  
  def <=>(other)
    unless @typeVal == other.typeVal
      return @typeVal <=> other.typeVal
    end
    otherNums = other.weightNums
    myNums = self.weightNums
    myNums.each_with_index do |num,idx|
      otherNum = otherNums[idx]
      return num <=> otherNum unless otherNum == num
    end
    return 0
  end
  
  TYPE = [:HighCard,:OnePair,:TwoPair,:ThreeOfaKind,:Straight,:Flush,
          :FullHouse,:FourOfaKind,:StraightFlush,:RoyalFlush]

  attr_reader :type,:typeVal
  
  def initialize(cards)
    @cards = cards.sort
    @type = determineType
    @typeVal = TYPE.index(@type)
  end

  def determineType
    group = numCountMap
    if group.size == size
      if straight?
        return :Straight unless flush?
        return :StraightFlush unless @cards[-1] == 14
        return :RoyalFlush 
      end
      return :HighCard unless flush?
      return :Flush
    else
      min,max = group.minmax_by{|k,v|v}
      if group.size == 4
        return :OnePair
      elsif group.size == 3
        return :ThreeOfaKind if max[-1] == 3
        return :TwoPair
      elsif group.size == 2
        return :FourOfaKind if max[-1] == 4
        return :FullHouse
      end
    end
  end
  
  def size
    @cards.size
  end

  def weightNums
    numCountMap.sort_by{|k,v|v}.map{|k,v|k}.reverse
  end
  
  def numCountMap
    group = {}
    @cards.each do |c|
      gp = group[c.num]
      gp ? (group[c.num] = gp + 1) : (group[c.num] = 1)
    end
    group
  end
  
  def straight?
    (1..@cards.size-1).all? do |idx|
      @cards[idx].num - @cards[idx-1].num == 1
    end
  end
  
  def flush?
    @cards.all? &->(c){c.color == @cards[-1].color}
  end
  
  def to_s
    @cards.join(" ")
  end
end

def readPairs
  pokers = IO.readlines("poker.txt")
  pokers.inject([]) do |pairs,ln|
    cards = ln.strip.split.map{|m|Card.new(m)}
    pairs << [Hand.new(cards[0..4]),Hand.new(cards[5..9])]
    pairs
  end
end

puts readPairs.count &->(pair){ pair[0] > pair[1] }
