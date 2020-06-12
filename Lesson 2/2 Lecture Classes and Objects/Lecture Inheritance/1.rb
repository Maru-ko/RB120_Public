class Dog
  def speak
    'bark!'
  end

  def swim
    'swimming!'
  end
end

class BullDog < Dog
  def swim
    "can't swim!"
  end
end

teddy = Dog.new
puts teddy.speak
puts teddy.swim
bull = BullDog.new
puts bull.speak
puts bull.swim
=begin

Class based inheritance works great when it's used to model hierarchical domains.

Subclassed objects can not only override methods, but also inherit methods.
=end