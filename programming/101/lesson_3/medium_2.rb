# medium_2.rb

# Question 1:

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" }
}
total = 0
munsters.each do |key, value|
  total += value['age'] if value['gender'] == 'male'
end

total

# Question 2:

munster.each { |key, value| puts "#{name} is a #{value['age']} year old #{value['gender']}.} "}

Question 3:

# Question 4: 
sentence = "Humpty Dumpty sat on a wall."
sentence.split(/\W/).reverse().join(" ") + '.'

# Question 5:
34

# Question 6"
Yes, the family data was messed up.

# Question 7
 'paper'

# Question 8:
"no"