puts "Type a positive integer and press enter."

num = gets.chomp.to_i

if num < 50
  puts "Your number is between 0 and 50."
elsif num < 100
  puts "Your number is between 50 and 100."
else
  puts "Your number is greater than 100."
end
