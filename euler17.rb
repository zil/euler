class LiteralNO
  ONE_TO_TEN = %w[one two three four five six seven eight nine ten]
  ELEVEN_TO_NINETEEN = %w[eleven twelve thirteen fourteen fifteen sixteen
   seventeen eighteen nineteen]
  TWENTY_NINETY = %w[twenty thirty forty fifty sixty seventy eighty ninety]
  AND = 3
  HUNDRED = "hundred".size
  THOUSAND = "thousand".size

  def len1_9
    len1_10 - 3
  end
  
  def len1_10
    ONE_TO_TEN.inject(0){|s,n|s + n.size}
  end

  def len11_19
    ELEVEN_TO_NINETEEN.inject(0){|s,n|s + n.size}
  end

  def len1_19
    len1_10 + len11_19
  end

  def len20_99
    ty = TWENTY_NINETY.inject(0){|s,n|s + n.size}
    ty * 10 + len1_9 * TWENTY_NINETY.size
  end

  def len1_99
    len1_19 + len20_99
  end

  def len100_1000
    thousand = "one".size + THOUSAND      #1000
    only_hundred = 9 * HUNDRED + len1_9   # 100,200,...,900
    hundred_and = 99 * (HUNDRED + AND) * 9
    beforeHundred = len1_9 * 99
    afterHundred = len1_99 * 9

    thousand + only_hundred \
    + beforeHundred + hundred_and + afterHundred
  end

  def result
    len1_99 + len100_1000
  end
end

p LiteralNO.new.result

