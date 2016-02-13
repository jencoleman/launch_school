require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')

def prompt(message)
  Kernel.puts("=> #{message}")
end

def validate_number?(number)
  number.to_i.to_s == number || number.to_f.to_s == number
end

def oper_to_message(op)
  case op
  when '1'
    "Adding"
  when '2'
    "Subtracting"
  when '3'
    "Multiplying"
  when '4'
    "Dividing"
  end
end

num1 = ''
num2 = ''
prompt(MESSAGES['welcome'])
name = ''
loop do
  name = Kernel.gets().chomp()
  break if name.empty? == false
  prompt(MESSAGES['valid_name'])
end

# main loop
loop do
  loop do
    prompt(MESSAGES['input_num'])
    num1 = gets.chomp

    break unless validate_number?(num1) == false
    prompt(MESSAGES['invalid_num'])
  end

  loop do
    prompt(MESSAGES['input_num'])
    num2 = gets.chomp

    break if validate_number?(num2)
    prompt(MESSAGES['invalid_num'])
  end

  oper_prompt = <<-MSG
    What operation would you like me to perform?
    1) add
    2) subtract
    3) multiply
    4) divide
  MSG

  prompt(oper_prompt)
  oper = ''

  loop do
    oper = Kernel.gets().chomp()
    break if %w(1 2 3 4).include?(oper)
    prompt(MESSAGES['invalid_oper'])
  end

  prompt("#{oper_to_message(oper)} your two numbers.")
  sleep 1

  result = case oper
           when '1'
             num1.to_i + num2.to_i
           when '2'
             num1.to_i - num2.to_i
           when '3'
             num1.to_i * num2.to_i
           when '4'
             num1.to_f / num2.to_f
           end

  prompt("Your solution is: #{result}.")
  prompt(MESSAGES['another'])
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')

  prompt(MESSAGES['valediction'])
end
