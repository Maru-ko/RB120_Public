class Animal
  def eat
    puts "Digesting food"
  end
end

class Fish < Animal
  def eat
    puts "Swallowing food"
  end
end

class Cat < Animal
  def eat
    puts "Masticating food"
  end
end

def feed_animal(animal)
  animal.eat
end

array_of_animals = [Animal.new, Fish.new, Cat.new]
array_of_animals.each { |animal| feed_animal(animal) }

=begin


=end