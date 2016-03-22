# medium 1
=begin
Question 1: Ben is right

Question 2: the code fails because its attr_reader, meaning there 
isn't a write method that can be accessed by 'quantity' to update the 
variable. Just change that to attr_accessor, and its good to go.

Question 3: there's nothing wrong, but using attr_accessor or attr_writer allow for those variables to be directly changed, which we may not want.

Question 4: 
=end

class Greeting
  def greet(string)
    puts string
  end
end

class Hello < Greeting
  def hi
    greet("Hello")
  end
end

class Goodbye < Greeting
  def bye
    greet("Goodbye")
  end
end


# Question 5: 
class KrispyKreme
  attr_accessor :filling_type, :glazing

  def initialize(filling_type, glazing)
    @filling_type = filling_type
    @glazing = glazing
  end

  def to_s
    if filling_type == nil && glazing == nil
      "Plain"
    elsif filling_type == nil && glazing
      "Plain with #{glazing}"
    elsif filling_type && glazing == nil
      "#{filling_type}"
    elsif filling_type && glazing
      "#{filling_type} with #{glazing}"
    end
  end
end

#Question 6: they work basically the same

# Question 7: make it information instead of light_information