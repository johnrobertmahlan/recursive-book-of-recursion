def sum_powers_of_two(n)
  total = (1..n).to_a.reduce(0) do |sum, num|
    sum += 2 ** num
  end

  total
end

puts sum_powers_of_two(3)