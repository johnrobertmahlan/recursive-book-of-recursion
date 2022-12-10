def concat(arr_of_strings)
  # BASE CASE: an empty array
  return '' if arr_of_strings.empty?

  # RECURSIVE CASE: concatenate the head to concat(tail)
  head = arr_of_strings.first
  tail = arr_of_strings[1..-1]
  return arr_of_strings.first + concat(tail)
end

puts concat(['Hello', 'World', 'take', 'a', 'look', 'at', 'me'])