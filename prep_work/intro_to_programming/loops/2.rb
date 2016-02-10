loop do
  puts "Type something."
  x = gets.chomp
  
  if x == "STOP"
    break
  else
   puts "Oh I just love " + x + "."
  end
end