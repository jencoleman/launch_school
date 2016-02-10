def prompt(message)
  Kernel.puts("=> #{message}")
end

def validate_number?(i)
  i.to_i() != 0
end

def oper_to_message(op)
  case op.downcase
  when 'add'
    "Adding"
  when 'subtract'
    "Subtracting"
  when 'multiply'
    "Multiplying"
  when 'divide'
    "Dividing"
  end
end
num1 = 
num2 = 

prompt("Welcome! I am a calculator. Enter your name:")

loop do
  name = Kernel.gets().chomp()
  
  if name.empty?()
    prompt("Make sure to use a valid name.")
  else
    break
  end
end

loop do #main loop
loop do
  prompt("Please input a number.")
  num1 = gets.chomp.to_i
  
  if validate_number?(num1)
    break
  else
    prompt("Hmmm....that doesn't loop like a valid number.")
  end
end

loop do
  prompt("Please input another number.")
  num2 = gets.chomp.to_i
  
  if validate_number?(num2)
    break
  else
    prompt("Hmmm....that doesn't loop like a valid number.")
  end
end
oper_prompt = <<-MSG
  What operation would you like me to perform?
MSG

prompt(oper_prompt)
oper = ''

loop do
  array = ['add', 'subtract', 'multiply', 'divide']
  oper = Kernel.gets().chomp()
  if  array.include?(oper)
    break
  else
    prompt("Please enter a valid operation.")
  end
end

prompt("#{oper_to_message(oper)} your two numbers.")
sleep 1

result = case oper.downcase
  when 'add'
    num1 + num2
  when 'subtract'
    num1 - num2
  when 'multiply'
    num1 * num2
  when 'divide'
    num1.to_f / num2.to_f
end

prompt("Your solution is: #{result}.")
prompt("Do you want to perform another calculation?")
answer = Kernel.gets().chomp()
break unless answer.downcase().start_with?('y')

prompt("Goodbye!")
end
  