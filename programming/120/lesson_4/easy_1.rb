# easy_1

# Question 1: they are all objects.

#Question 2: 

module Speed
  def go_fast
    puts "I am a #{self.class} and going super fast!"
  end
end

class Car
  include Speed

  def go_slow
    puts "I am safe and driving slow."
  end
end

class Truck
include Speed

  def go_very_slow
    puts "I am a heavy truck and like going very slow."
  end
end

ford_escort = Car.new
ford_escort.go_fast
gmc = Truck.new
gmc.go_fast

# Question 3:
# The go_fast method calls self.class, which is a built-in class method.

# Question 4:
class AngryCat
  def hiss
    puts "Hisssss!!!"
  end
end

garfield = AngryCat.new

# Question 5: pizza, because instance variables begin with @

# Question 6: we could add a method that returns @volume or
# call instance_variable_get("@volume")

# Question 7: Ruby will print the object id.

# Question 8: self refers to the instance of the class, the calling object.

# Question 9: self refers to the Cat class, not an instance of Cat class.

# Question 10: I need to call the method with Bag.new(a, b), and fill in 
# the color and material inside the method call.