def prog1(input) 
  input.each_key { |k| puts k }
end

def prog2(input)
  input.each_value { |v| puts v }
end

def prog3(input)
  input.each_pair { |kv| puts kv }
end
numbers = {:a=>12, :b=>13, :c=>14, :d=>15, :e=>16, :f=>17}
prog1(numbers)
prog2(numbers)
prog3(numbers)