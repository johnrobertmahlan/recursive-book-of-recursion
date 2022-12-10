def product(nums)
  # BASE CASE: when nums is empty, the PRODUCT (as opposed to SUM) is 1
  return 1 if nums.empty?

  # RECURSIVE CASE: pop off the head and multiply by product(tail)
  head = nums.first
  tail = nums[1..-1]
  return head * product(tail)
end

puts product([1,2,3, 30, 2, 4])