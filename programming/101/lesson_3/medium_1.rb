# medium_1.rb

# Question 1:
(0...10).each { |num| puts " " * num + "The Flintstones Rock!"}

# Question 2:
letter_hash = {}
statement = "The Flintstones Rock"
statement_array = statement.split("")

statement_array.each { |letter| letter_hash[letter] = statement.count(letter) }

# Question 3: it will error because you can't add an integer and a string. Here's the fix:
puts "the value of 40 + 2 is " + (40 +2).to_s
OR
puts "the value of 40 + 2 is #{40 + 2}"

# Question 5:
def factors(number)
  dividend = number
  divisors = []
  begin
    if dividend <= 0
      puts "This program will not work with a zero or negative input."
      break
    end
    divisors << number / dividend if number % dividend == 0
    dividend -= 1
  end until dividend == 0
  divisors
end

# The modulus determines if the divisor will divide the dividend without leaving a remainder.
# The divisors line returns the array containing all of the divisors

# Question 6:
# Yes, there is a difference. The << will mutate the original array, and the + will not.

# Question 7: methods cannot use an input unless it is passed in as a parameter

def fib(first_num, second_num, limit)
  while second_num < limit
    sum = first_num + second_num
    first_num = second_num
    second_num = sum
  end
  sum
end

# Question 8: my own titleize!

def titleize(string)
  string_array = string.split(" ")
  string_array.each { |word| word.capitalize!() }
  string = string_array.join(" ")
end

titleize("the rain in spain")

#Question 9: add key,value to munsters hashes

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

munsters.each do |key, value|

  case value['age']
  when (0...18)
    value['age_group'] = 'kid'
  when (18...65)
    value['age_group'] = 'adult'
  else
    value['age_group'] = 'senior'
  end
end
munsters

