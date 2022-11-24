def recursive_sum_series(n)
  return 1 if n == 1

  return n + recursive_sum_series(n - 1)
end

puts recursive_sum_series(3)