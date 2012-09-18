class PowerDigit
  class << self
    def digitPower(n,power)
      return 0 if not n.is_a? Integer || n < 1
      n.to_s.chars.inject(0) do |s,c|
        s + c.to_i ** power
      end
    end

    def qualify(n,power)
      digitPower(n,power) == n
    end

    def nums(power)
      (11..upper(power)).select{|n|qualify(n,power)}
    end
    
    def sum(power)
      nums(power).inject{|sum,num|sum + num}
    end

    def upper(power)
      low,start = 10,99
      until low > digitPower(start,power) do
        start = start * 10 + 9
        low *= 10
      end
      start / 10
    end
  end

end

p PowerDigit.sum(5)
