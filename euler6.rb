$sum_square = (1..100).inject{|sum,n|sum += n*n}
$square_sum = ((1..100).inject{|sum,n| sum += n})**2
p $square_sum - $sum_square
