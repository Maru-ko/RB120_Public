class Pet
  def run
    'running!'
  end

  def jump
    'jumping!'
  end

end

class Dog < Pet
  def speak
    'bark!'
  end

  def swim
    'swimming!'
  end

  def fetch
    'fetching!'
  end
end

class BullDog < Dog
  def swim
    "can't swim!"
  end
end

class Cat < Pet
  def speak
    'meow'
  end
end


teddy = Dog.new
puts teddy.speak
puts teddy.swim
bull = BullDog.new
puts bull.speak
puts bull.swim
pete = Pet.new
kitty = Cat.new
dave = Dog.new
bud = BullDog.new
puts pete.run
puts pete.speak
puts kitty.run
puts kitty.speak
puts kitty.fetch
puts dave.speak
puts bud.run
puts bud.swim
=begin
OOP allows us to organize behaviours into classes, and set up a hierarchical structure
that takes advantage  of inheritance.
Inheriting behaviours is a way to re-use common behaviours.
=end