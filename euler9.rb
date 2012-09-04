def result
  1.upto(499){|a|
    1.upto(499){|b|
      next if a + b < 501
      c = 1000-a-b
      return a*b*c if (a**2+b**2)==c**2
    }
  }
end

p result
