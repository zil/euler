require 'date'
def sundayCount(low,high)
  count = 0
  while low < high do
    count += 1 if low.sunday?
    low = low.next_month
  end
  count
end

p sundayCount(Date.new(1901,1,1),Date.new(2000,12,31))
