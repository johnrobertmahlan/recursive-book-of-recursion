def recursive_sum_of_powers_of_two(n)
  return 2 if n == 1

  product = 2 ** n
  return product + recursive_sum_of_powers_of_two(n - 1)
end

puts recursive_sum_of_powers_of_two(3)