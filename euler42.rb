def triangleNO?(num)
  product = 2 * num
  root = Math::sqrt(product)
  floor,ceil = root.floor,root.ceil
  floor != ceil && floor * ceil == product
end

def wordVal(word)
  word.downcase.codepoints.inject(0) do |sum,code|
    sum + (code - 96)
  end
end

def words
  words = IO.read("words.txt")
  words.split(',').map do |word|
    word.gsub("\"","")
  end
end

p words.count{|w|triangleNO?(wordVal(w))}
