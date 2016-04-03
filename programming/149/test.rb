  class Person
    attr_accessor :name
    
    def initialize(n)
      @name = n
    end

    def change_info(new_name)
      self.name = new_name         # invoking the setter method
    end

  end

  bob = Person.new('bob')
  bob.change_info('Robert')

  puts bob.name