class GoodDog
  DOG_YEARS = 7

  attr_accessor :name, :age

  def initialize(n, a)
    self.name = n
    self.age = a * DOG_YEARS
  end

  def to_s
    "This pooch's name is #{name} and it is #{age} in dog years."
  end
end

sparky = GoodDog.new("Sparky", 4)
p sparky
puts sparky
puts
puts "#{sparky}; we just used string interpolation to expose our #to_s method."