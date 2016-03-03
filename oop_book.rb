=begin

The Object Model
1. 
class Bird
end

birdie = Bird.new
alex = Bird.new

2. A module is a structure that encapsulates functionality, so that 
it can easily be added to a class, and kept seperate from the rest
of the namespace.

module Move
  def fly
    puts "Flappy-flappy"
  end
end

class Bird
  include Move
  
  def initialize(name)
    @name = name
  end
end

birdie = Bird.new("Birdie")

Classes and Objects, Part 1

Exercises 1, 2, 3
class MyCar
  attr_accessor :current_speed, :color
  attr_reader :year
  def initialize(year, color, model)
    @year = year
    @color = color
    @model = model
    @current_speed = 0
  end

  def speed_up(number)
    @current_speed += number
    puts "You push the gas, and accelerate #{number} miles per hour."
  end

  def brake(number)
    @current_speed -= number
    puts "You push the brake, and deccelerate #{number}."
  end

  def current_speed
    puts "You are now going #{@current_speed} mph."
  end

  def shut_off
    @current_speed = 0
    puts "Let's park this bad boy!"
  end

  def spray_paint(new_color)
    self.color = new_color
    puts "Your car is now #{new_color}."
  end
end

OOP, Part II

class GoodDog
  @@number_of_dogs = 0
  
  def initialize
    @@number_of_dogs += 1
  end
end

dog1 = GoodDog.new
dog2 = GoodDog.new

puts GoodDog.total_number_of_dogs
  
