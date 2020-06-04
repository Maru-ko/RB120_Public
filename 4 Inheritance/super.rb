class Animal
  def speak
    "Hello!"
  end
end

class GoodDog < Animal
  def speak
    super + " from #{self.class} class."
  end
end

sparky = GoodDog.new
puts sparky.speak