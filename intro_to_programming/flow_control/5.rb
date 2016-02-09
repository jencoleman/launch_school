def evaluate(num)
case
  when num < 50
    puts "Your number is between 0 and 50."
  when num < 100
    puts "Your number is between 50 and 100."
  else
    puts "Your number is greater than 100."
end
end
puts "Type a positive integer and press enter."

num = gets.chomp.to_i
evaluate(num)
