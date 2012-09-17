class WordScore
  def initialize
    @words = sortedNames
  end

  def sortedNames
    con = IO.read("names.txt")
    words = con.split(",")
    words.sort.map do |w|
      w[1..-2]
    end
  end

  def score(word,idx)
    val = word.each_byte.inject(0){|s,b|s + (b + 1 - 'A'.ord)}
    val * idx
  end

  def totalScore
    total = 0
    @words.each_with_index do |word,idx|
      total += score(word,idx + 1)
    end
    total
  end

end

p WordScore.new.totalScore
