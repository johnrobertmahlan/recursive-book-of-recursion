def sum_series(n)
  (0..n).to_a.reduce(:+)
end

puts sum_series(3)

def sum_series_without_reduce(n)
  sum = 0
  (0..n).to_a.each do |num|
    sum += num
    sum
  end

  sum
end

puts sum_series_without_reduce(3)