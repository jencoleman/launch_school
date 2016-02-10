puts "Type a number."
num = gets.chomp.to_i

def recursive(num)
((num - 1)...0).each { |i| 
 i
 if i < num
  recursive(i -1)
  
}
end
