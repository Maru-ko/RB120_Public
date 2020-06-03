class GoodDog
  @@number_of_dogs = 0

  def initialize(name)
    @name = name
    @@number_of_dogs += 1
  end

  def speak
    puts "#{@name} says Arf!"
  end

  def self.what_am_i
    "I'm a GoodDog class!"
  end

  def self.total_number_of_dogs
    @@number_of_dogs
  end

end



puts GoodDog.what_am_i

sparky = GoodDog.new("Sparky")
fido = GoodDog.new("Fido")
puts GoodDog.total_number_of_dogs
koiny = GoodDog.new("Koko")
puts GoodDog.total_number_of_dogs