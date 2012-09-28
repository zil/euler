def ways
  count = 0
  0.step(200,2) do |a|
    a.step(200,5) do |b|
      b.step(200,10) do |c|
        c.step(200,20) do |d|
          d.step(200,50) do |e|
            e.step(200,100) do |f|
              f.step(200,200) do |g|
                count += 1
              end
            end
          end
        end
      end
    end
  end
  count
end

p ways
