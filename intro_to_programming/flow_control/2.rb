def all_caps(stringy)
  if string.length > 10
    return stringy.upcase
  else
    return string
  end
end

puts all_caps("Fortune favors the brave.")