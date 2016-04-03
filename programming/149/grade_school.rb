# grade_school.rb

class School
  def initialize
    @main_hash = {}
  end

  def to_h
    sortie = {}
    @main_hash.keys.sort.each { |key| sortie[key] = @main_hash[key].sort }
    sortie
  end

  def add(name, number)
    @main_hash[number] ? @main_hash[number].push(name) : @main_hash[number] = [name]
  end

  def grade(number)
    @main_hash[number] ? @main_hash[number] : []
  end
end
