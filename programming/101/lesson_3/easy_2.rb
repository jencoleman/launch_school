# easy_2

# Question 1: does spot have an age?

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
ages.key?('Spot')

# Question 2: add up ages

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

total = 0
ages.each { |_, value| total = total + value }
total

#Question 3: throw out the olds

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
ages.delete_if { |key, value| value > 100 }

# Question 4: 
munsters_description = "The Munsters are creepy in a good way."
munsters_description.capitalize!
munsters_description.swapcase!
munsters_description.downcase!
munsters_description.upcase!

# Question 5: 
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10 }
additional_ages = { "Marilyn" => 22, "Spot" => 237 }

additional_ages.each do |key, value|
  ages[key] = value
end

# Question 6: lowest key value
ages.values.min

#Question 7"
advice = "Few things in life are as important as house training your pet dinosaur."
advice.match('Dino')

# Question 8:
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
flintstones.start_with?("Be")

# Question 9:
flintstones.map! do |name|
  name[0, 3]
end

# Question 10:
flintstones.map! { |name| name[0, 3] }