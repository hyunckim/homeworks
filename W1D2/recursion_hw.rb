def sum_to(n)
  return n if n == 0
  return nil if n < 0
  n + sum_to(n - 1)
end

def add_numbers(nums_array)
  return nil if nums_array.empty?
  return nums_array[0] if nums_array.size <= 1

  nums_array[0] + add_numbers(nums_array[1..-1])
end

def gamma_fnc(n)
  return nil if n == 0
  return 1 if n == 1

  (n - 1) * gamma_fnc(n - 1)
end
