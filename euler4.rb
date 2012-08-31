def largestPalin
(999.downto(900)).each{|n1|
  (999.downto(900)).each{|n2|
      tmp = (n1 * n2).to_s
      len = tmp.size / 2
      isPalin = (1..len).all?{|le|
        tmp[le-1] == tmp[-le]
      }
      return [tmp,n1,n2] if isPalin # or tmp == tmp.reverse
  }
}
end

p largestPalin
