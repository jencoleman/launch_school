#easy 3

# Question 1: 
case 1: => "Hello"
case 2: => unknown method
case 3: => given 0 arguments, needs 1 argument
case 4:  => "Goodbye"
case 5: nothing... we don't have such a class method

#Question 2: could fix it by making that a class method

class Hello < Greeting
  def self.hi
    greet("Hello")
  end
end

Hello.hi

# Question 3: 

garfield = AngryCat.new(19, "Garfield")
whiskers = AngryCat.new(8, "Whiskers")

# Question 4:
class Cat
  def initialize(type)
    @type = type
  end

  def to_s
    "I am #{@type} cat"
  end
end

#Question 5: 

# Question 7: return