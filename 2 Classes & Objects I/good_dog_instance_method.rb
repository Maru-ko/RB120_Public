class GoodDog
  def initialize(name)
    @name = name
  end

  def speak
    "Arf!"
  end
end

sparky = GoodDog.new('Sparky')
puts sparky.speak

fido = GoodDog.new('Fido')
puts fido.speak
puts sparky.name