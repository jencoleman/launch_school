# easy_1.rb
=begin
Question 1: what will the code print?
numbers will print the array [1, 2, 2, 3], because it wasn't mutated

Question 2: ! vs. ?
When it precedes a statement, the bang makes something the opposite. True becomes false, etc. When it follows, it creates a method that will mutate the caller.

The ? is the ternary operator for if...else

!= means 'does not equal', and can be used in an equality statement
!user_name means 'NOT user_name
! after something mutates the caller
? before something
? after something turns it into 'if true'

=end

# Question 3:

advice = "Few things in life are as important as house training your pet dinosaur."
advice.sub!('important', 'urgent')

# Question 4:
# numbers.delete_at(1) deletes the item at the 1 index
# number.delete(1) will find the 1, wherever it is, and delete the first instance of it

# Question 5: is 42 between 10 and 100
(10...100).include?(42) || (10..100).include?(42)

# Question 6: two ways to prepend to a string
famous_words = "seven years ago..."
"Four score and #{famous_words}"
famous_words.prepend("Four score and ")

# Question 7:
42

# Question 8:
flintstones = ["Fred", "Wilma", ["Barney", "Betty"], ["BamBam", "Pebbles"]]
flintstones.flatten

# Question 9:
flintstones = { "Fred" => 0, "Wilma" => 1, "Barney" => 2, "Betty" => 3, "BamBam" => 4, "Pebbles" => 5 }
flintstones = flintstones.assoc('Barney')

# Question 10:
flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]
flintstones_hash = {}
flintstones.each_with_index do |name, index|
  flintstones_hash[name] = index
end
