# mortgage calculator

require 'yaml'
MESSAGES = YAML.load_file('mort.yml')

def prompt(string)
  puts "=> #{string}"
end

def valid_num?(num)
  num.to_f.to_s == num || num.to_i.to_s == num
end

prompt(MESSAGES['welcome'])

loop do
  prompt(MESSAGES['amt'])
  amt_loan = ''

  loop do
    amt_loan = gets.chomp
    break if valid_num?(amt_loan) && !amt_loan.empty?
    prompt(MESSAGES['invalid_number'])
  end

  prompt(MESSAGES['apr'])
  apr = ''

  loop do
    apr = gets.chomp
    break if valid_num?(apr) && !apr.empty?
    prompt(MESSAGES['invalid_number'])
  end

  prompt(MESSAGES['duration'])
  duration = ''

  loop do
    duration = gets.chomp
    break if valid_num?(duration) && !duration.empty?
    prompt(MESSAGES['invalid_number'])
  end

  annual_percentage = apr.to_f() / 100
  month_rate = annual_percentage / 12
  months = duration.to_i * 12
  month_pay = (amt_loan.to_f * ((month_rate * (1 + month_rate)**months) / ((1 + month_rate)**months - 1))).round(2)
  prompt("Your loan of $#{amt_loan} at #{apr}% APR for #{months} months has a monthly payment of $#{month_pay}.")

  prompt(MESSAGES['continue'])
  reply = gets.chomp
  break unless reply.downcase().start_with?('y')
end

prompt(MESSAGES['valediction'])