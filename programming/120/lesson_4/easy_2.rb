# easy_2.rb

#Question 1: it will return a string with a randomly chosen fortune.

# Question 2: it will return a string with a fortune chosen from 
# the travel-related choices array, because that supercedes the 
# choices superclass array.

# Question 3: call ancestors on the class.
# Orange and HotSauce check their respective classes, then the module,
# then Object, Kernel, BasicObject

# Question 4: add attr_accessor at the top, which return the object,
# and adds read-write capabilities. It is standard practice to refer to the instance variables
# without @ if the attr_ method is set

# Question 5: the @ sign helps. 1 @ is instance, two @ is class. No @
# means its a regular string variable, possibly a local variable inside of a method.

# Question 6: the self.manufacturer method is a class method, because 
# 'self' is in the method's name, not inside of the method somewhere.

# Question 7: @@cats_count is a running tally of how many times the 
# class has been initialized... so it counts how many cats we've created
# using the class. To test it:

class Cat
  @@cats_count = 0

  def initialize(type)
    @type = type
    @age  = 0
    @@cats_count += 1
  end

  def self.cats_count
    @@cats_count
  end
end

garfield = Cat.new("orange tabby")
kitty = Cat.new("manx")
Cat.cats_count

#Question 8: 
class Bingo < Game
  def rules_of_play
    #rules of play
  end
end

# Question 9: the bingo play method would override the Game play method.

# Question 10: benefits... inheritance is useful, helps keep the code
# base clean so methods don't affect other areas of the code
