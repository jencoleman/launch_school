array = [8,38,68,9,28,98,188]


puts "Here are my favorite numbers, in order of preference."
array.each_with_index { |item, index|
  puts "#" + (index + 1).to_s + " on the list is " + item.to_s + "."
}