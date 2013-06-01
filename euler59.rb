class XorDecrypt

  def initialize
    numstr = IO.read("cipher1.txt")
    @ciperedNums = numstr.strip.split(",").map{|s|s.to_i}
    @key = findKey
  end
  
  def legalKey?(key)
    ring = key.size
    wordCode = (32..90).to_a + (97..122).to_a
    @ciperedNums.each_with_index do |byte,idx|
      decryptedChr = byte ^ key[idx % ring]
      return false unless wordCode.member?(decryptedChr)
    end
    true
  end

  def findKey
    possibleKeys = (97..122).to_a.permutation(3).to_a
    possibleKeys.each do |key|
      return key if legalKey?(key)
    end
    nil
  end

  def sum
    sum,ring = 0,@key.size
    @ciperedNums.each_with_index do |num,idx|
      val = num ^ @key[idx % ring]
      sum += val
    end
    sum
  end

end

p XorDecrypt.new.sum
