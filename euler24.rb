def lexicoPermu(count)
  lex = (0..9).to_a.permutation.map do |p|
    p.join
  end
  lex[count % lex.size - 1]
end

p lexicoPermu(10**6)
